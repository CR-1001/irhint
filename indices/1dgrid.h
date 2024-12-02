/******************************************************************************
 * Project:  hint
 * Purpose:  Indexing interval data
 * Author:   Panagiotis Bouros, pbour@github.io
 * Author:   George Christodoulou
 ******************************************************************************
 * Copyright (c) 2020 - 2022
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

#ifndef _1D_GRID_H_
#define _1D_GRID_H_

#include "../def_global.h"
#include "../containers/relations.h"



class OneDimensionalGrid
{
private:
    PartitionId numPartitions;
    PartitionId numPartitionsMinus1;
    Timestamp gstart;
    Timestamp gend;
    Timestamp partitionExtent;
    RecordId numIndexedRecords;

    Relation *pRecs;
    size_t *pRecs_sizes;

    // Construction
    inline void updateCounters(const Record &r);
    inline void updatePartitions(const Record &r);

public:
    // Statistics
    PartitionId numEmptyPartitions;
    float avgPartitionSize;
    size_t numReplicas;
    
    // Construction
    OneDimensionalGrid();
    OneDimensionalGrid(const Relation &R, const PartitionId numPartitions);
    OneDimensionalGrid(const Relation &R, const Relation &U, const PartitionId numPartitions);  // For updates only
    void print(char c);
    void getStats();
    size_t getSize();
    ~OneDimensionalGrid();

    // Updating
    void insert(const Record &r);

    // Querying
    void moveOut_checkBoth_gOverlaps(const RangeQuery &q, RelationId &candidates);
    void interesect_gOverlaps(const RangeQuery &q, RelationId &candidates);
    void interesectAndOutput_gOverlaps(const RangeQuery &q, RelationId &candidates, RelationId &result);
};



class OneDimensionalGrid_RecordStart
{
private:
    PartitionId numPartitions;
    PartitionId numPartitionsMinus1;
    Timestamp gstart;
    Timestamp gend;
    Timestamp partitionExtent;
    RecordId numIndexedRecords;

    RelationStart *pRecs;
    size_t *pRecs_sizes;

    // Construction
    inline void updateCounters(const Record &r);
    inline void updatePartitions(const Record &r);

public:
    // Statistics
    PartitionId numEmptyPartitions;
    float avgPartitionSize;
    size_t numReplicas;
    
    // Construction
    OneDimensionalGrid_RecordStart();
    OneDimensionalGrid_RecordStart(const Relation &R, const PartitionId numPartitions);
    OneDimensionalGrid_RecordStart(const Relation &R, const Relation &U, const PartitionId numPartitions);
    void print(char c);
    void getStats();
    size_t getSize();
    ~OneDimensionalGrid_RecordStart();

    // Updating
    void insert(const Record &r);

    // Querying
    void interesect_gOverlaps(const RangeQuery &q, RelationId &candidates);
    void interesectAndOutput_gOverlaps(const RangeQuery &q, RelationId &candidates, RelationId &result);    // For updates only
};
#endif // _1D_GRID_H_
