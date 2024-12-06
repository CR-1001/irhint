/******************************************************************************
 * Project:  irhint
 * Purpose:  Fast indexing for termporal information retrieval
 * Author:   Panagiotis Bouros, pbour@github.io
 * Author:   George Christodoulou
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

#ifndef _INVERTED_FILE_H_
#define _INVERTED_FILE_H_

#include <unordered_map>
#include "../containers/relations.h"
#include "../def_global.h"



class InvertedFileTemplate
{
public:
    // Statistics
    RecordId numIndexedRecords;
    TermId numEmptyLists;
    TermId avgListSize;

    // Constructing
    InvertedFileTemplate()          { this->numEmptyLists = this->avgListSize = 0; };
    virtual void getStats()         { };
    virtual size_t getSize()        { return 0; };
    virtual void print(char c)      { };
    virtual ~InvertedFileTemplate() { };
    
    // Updating
    virtual void insert(IRelation &U) { };
    
    // Querying
    virtual void executeContainment(const RangeIRQuery &q, RelationId &result) { };
    virtual void executeContainment(const RangeIRQuery &q, vector<RelationId> &vec_result) {};
};



class InvertedFile : public InvertedFileTemplate
{
private:
    // Indexed relation
    IRelation R;

    // Posting lists
    unordered_map<TermId, RelationId> lists;
    
public:

    // Constructing
    InvertedFile();
    InvertedFile(const IRelation &R);
    void index(const IRecord &r);
    void getStats();
    size_t getSize();
    void print(char c);
    ~InvertedFile();

    // Querying
    bool moveOut(const RangeIRQuery &q, RelationId &candidates);
    bool intersect(const RangeIRQuery &q, const unsigned int termoff, RelationId &candidates);
    void intersectAndOutput(const RangeIRQuery &q, const unsigned int off, RelationId &candidates, RelationId &result);
};
#endif // _INVERTED_FILE_H_
