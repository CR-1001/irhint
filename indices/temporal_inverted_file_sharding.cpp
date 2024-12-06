/******************************************************************************
 * Project:  irhint
 * Purpose:  Fast indexing for termporal information retrieval
 * Author:   Christian Rauch
 ******************************************************************************
 * Copyright (c) 2023 - 2024
 *
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

#include "temporal_inverted_files.h"



TemporalInvertedFile_Sharding::TemporalInvertedFile_Sharding()
{
}


// Undecided if we should use two passes during construction
TemporalInvertedFile_Sharding::TemporalInvertedFile_Sharding(IRelation &R, const unsigned int impactListGap, const float relaxation) : InvertedFileTemplate()
{
//    this->R = &R;
//    this->R->sortByStart();
    R.sortByStart();

    this->tolerance = R.domainSize * (relaxation / 100.0);

    for (const auto& r : R)
    {
        for (const auto& t : r.terms)
        {
            auto& list = this->lists[t];

            if (list == nullptr) list = new ShardedPostingList();

            list->addRecord(r.id, r.start, r.end, impactListGap, this->tolerance);
        }
    }
}


TemporalInvertedFile_Sharding::TemporalInvertedFile_Sharding(IRelation &R, IRelation &U, const unsigned int impactListGap, const float relaxation) : InvertedFileTemplate()
{
    this->impactListGap = impactListGap;

    R.sortByStart();

    auto domainSize = max(R.domainSize, U.domainSize);

    this->tolerance = domainSize * (relaxation / 100.0);

    for (const auto& r : R)
    {
        for (const auto& t : r.terms)
        {
            auto& list = this->lists[t];

            if (list == nullptr) list = new ShardedPostingList();

            list->addRecord(r.id, r.start, r.end, impactListGap, this->tolerance);
        }
    }
}


void TemporalInvertedFile_Sharding::getStats()
{

}


size_t TemporalInvertedFile_Sharding::getSize()
{
    size_t size = this->lists.size() * sizeof(TermId);
    for (auto& l : this->lists) size += l.second->getSize(); 

    return size;
}


TemporalInvertedFile_Sharding::~TemporalInvertedFile_Sharding()
{
    for (auto iterL = this->lists.begin(); iterL != this->lists.end(); iterL++)
        delete iterL->second;
}


void TemporalInvertedFile_Sharding::print(char c)
{
    cout << "List or term count: " << this->lists.size() << endl;

    for (auto iter = this->lists.begin(); iter != this->lists.end(); ++iter)
    {
        cout << "[term:" << iter->first << "].postinglist: " << endl;
        iter->second->print();
    }
}


// Updating
void TemporalInvertedFile_Sharding::insert(IRelation &U)
{
    U.sortByStart();

    for (const auto& r : U)
    {
        for (const auto& t : r.terms)
        {
            auto& list = this->lists[t];

            if (list == nullptr) list = new ShardedPostingList();

            list->addRecord(r.id, r.start, r.end, this->impactListGap, this->tolerance);
        }
    }
}


// Querying
void TemporalInvertedFile_Sharding::executeContainment(const RangeIRQuery &q, RelationId &result)
{
    // Assumption: Terms are ordered by frequency
    auto elem_iter = q.terms.cbegin();
    auto elem_end  = q.terms.cend();

    this->moveOut(*elem_iter, result, q.start, q.end);

    if (result.size() == 0 || q.terms.size() == 1) return;

    sort(result.begin(), result.end());

    // intersect for the remaining terms
    elem_iter++;
    for (; result.size() > 0 && elem_iter < elem_end; elem_iter++)
    {
        this->intersect(*elem_iter, result, q.start, q.end);
    }
}


void TemporalInvertedFile_Sharding::moveOut(const TermId eid, RelationId &candidates, const Timestamp& qstart, const Timestamp& qend)
{
    auto list = this->lists.find(eid);

    if (list != lists.end()) 
    {
        list->second->getCandidates(qstart, qend, candidates);
    }
}


void TemporalInvertedFile_Sharding::intersect(const TermId eid, RelationId &candidates, const Timestamp& qstart, const Timestamp& qend)
{
    // assume ids are sorted in ascending order

    // obtain the grid for the term
    auto list = this->lists.find(eid);
    if (list == lists.end()) 
    {
        candidates.clear();
        return;
    }

    RelationId temp;
    RelationId plist;
    list->second->getCandidates(qstart, qend, plist);

    sort(plist.begin(), plist.end());

    RelationId::iterator list_begin = plist.begin(), list_end = plist.end();
    RelationId::iterator cand_begin = candidates.begin(), cand_end = candidates.end();

    while ((list_begin != list_end) && (cand_begin != cand_end))
    {
        if (*list_begin < *cand_begin) list_begin++;
        else if (*list_begin > *cand_begin) cand_begin++;
        else
        {
            temp.push_back(*list_begin++);
            cand_begin++;
        }
    }

    candidates.swap(temp);
}
