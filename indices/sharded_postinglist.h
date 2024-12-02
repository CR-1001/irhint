/******************************************************************************
 * Project:  irhint
 * Purpose:  Fast indexing for termporal information retrieval
 * Author:   Christian Rauch
 * Author:   Panagiotis Bouros, pbour@github.io
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

#ifndef _SHARDEDPOSTINGLIST_H_
#define _SHARDEDPOSTINGLIST_H_


#include <map>
#include <string>

#include "../containers/relations.h"
#include "../def_global.h"


// Stores the offsets in a shard
typedef map<Timestamp, size_t> ImpactList;


class Shard : public vector<Record>
{
public:

	Timestamp sstart = 0;
	Timestamp sstart_last = 0;
	Timestamp send = 0;
	ImpactList impactList;

	void getCandidates(
		const Timestamp& qstart, 
		const Timestamp& qend, 
		RelationId& candidates) const;

	size_t getSize();

	void print() const;
};


class ShardedPostingList : public vector<Shard>
{
public:

	void addRecord(
		const RecordId id,
		const Timestamp start,
		const Timestamp end,
		const RecordId impact_list_gap,
		const Timestamp relaxation);

	void getCandidates(
		const Timestamp& qstart, 
		const Timestamp& qend, 
		RelationId& candidates) const;

	size_t getSize();

	void print() const;
};



#endif //_SHARDEDPOSTINGLIST_H_