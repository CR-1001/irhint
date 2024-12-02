/******************************************************************************
 * Project:  irhint
 * Purpose:  Fast indexing for termporal information retrieval
 * Author:   Panagiotis Bouros, pbour@github.io
 * Author:   Christian Rauch
 ******************************************************************************
 * Copyright (c) 2020 - 2024
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



TemporalInvertedFile_HINTAlpha::TemporalInvertedFile_HINTAlpha()
{
}


// Undecided if we should use two passes
TemporalInvertedFile_HINTAlpha::TemporalInvertedFile_HINTAlpha(const IRelation &R, const unsigned int numBits = 0) : InvertedFileTemplate()
{
    TermId *lsizes = new TermId[R.dictionarySize]; // Counters
    unordered_map<TermId, Relation> tmplists;
    this->R = &R;

    
    // Step 1: one pass to count the contents inside each partition.
    memset(lsizes, 0, sizeof(TermId));
    for (auto &r : R)
    {
        for (auto &tid : r.terms)
            lsizes[tid]++;
    }

    // Step 2: allocate necessary memory
    for (TermId tid = 0; tid < R.dictionarySize; tid++)
    {
        if (lsizes[tid] > 0)
            tmplists[tid].reserve(lsizes[tid]);
    }
    delete[] lsizes;
    
    // Step 3: fill temporary postings lists
    for (const auto &r : R)
    {
        for (const auto &tid : r.terms)
        {
            auto &list = tmplists[tid];

            if (list.gstart > r.start)
                list.gstart = r.start;
            if (list.gend < r.end)
                list.gend = r.end;
            list.emplace_back(r.id, r.start, r.end);
        }
    }
    
    // Step 4: construct HINTs
    for (auto iterL = tmplists.begin(); iterL != tmplists.end(); iterL++)
    {
        iterL->second.domainSize = iterL->second.gend-iterL->second.gstart;
//        iterL->second.gstart = R.gstart;
//        iterL->second.gend = R.gend;
//        cout << "t" << iterL->first << ": " << iterL->second.size() << " interval(s)" << endl;
        this->lists.insert(make_pair(iterL->first, new HINT_M_SubsSort_SS_CM(iterL->second, numBits)));
//        cout << "\tHINT constructed" << endl;
    }
//    cout<<"done"<<endl;

    tmplists.clear();
}


void TemporalInvertedFile_HINTAlpha::getStats()
{
//    size_t sum = 0;
//
//    this->numEmptyLists = this->R->dictionarySize - this->lists.size();
//    for (auto iter = this->lists.begin(); iter != this->lists.end(); iter++)
//        sum += iter->second.size();
//    this->avgListSize = (float)sum/this->lists.size();
}


size_t TemporalInvertedFile_HINTAlpha::getSize()
{
    size_t size = 0;
    
    for (auto iterL = this->lists.begin(); iterL != this->lists.end(); iterL++)
        size += iterL->second->getSize();
    
    return size;
}


TemporalInvertedFile_HINTAlpha::~TemporalInvertedFile_HINTAlpha()
{
    for (auto iterL = this->lists.begin(); iterL != this->lists.end(); iterL++)
        delete iterL->second;
}


void TemporalInvertedFile_HINTAlpha::print(char c)
{
//    for (auto iter = this->dlists.begin(); iter != this->dlists.end(); iter++)
//    {
//        cout << "t" << iter->first << " (" << iter->second.size() << "):";
//        for (auto &r : iter->second)
//            cout << " " << c << r.id;
//        cout << endl;
//    }
}


// Querying
bool TemporalInvertedFile_HINTAlpha::moveOut_gOverlaps(const RangeIRQuery &q, RelationId &candidates)
{
    auto iterL = this->lists.find(q.terms[0]);
    
    // If the inverted file does not contain the term then result must be empty
    if (iterL == this->lists.end())
        return false;
    else
    {
        iterL->second->moveOut_gOverlaps(RangeQuery(q.id, q.start, q.end), candidates);
                
        return (!candidates.empty());
    }
}


bool TemporalInvertedFile_HINTAlpha::verify_gOverlaps(const RangeIRQuery &q, const unsigned int off, RelationId &candidates, RelationId &result)
{
    for (auto cid : candidates)
    {
        const IRecord &r = this->R->at(cid);
        if (r.containsTerms(q.terms, off))
            result.push_back(cid);
    }
    
    return (!result.empty());
}


void TemporalInvertedFile_HINTAlpha::executeContainment(const RangeIRQuery &q, RelationId &result)
{
    RelationId candidates;
    auto numQueryTerms = q.terms.size();
    
    if (numQueryTerms == 1)
        this->moveOut_gOverlaps(q, result);
    else
    {
        if (!this->moveOut_gOverlaps(q, candidates))
            return;

        this->verify_gOverlaps(q, 1, candidates, result);
    }
}

