#include "bitset.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

// create a new, empty bit vector set with a universe of 'size' items
struct bitset * bitset_new(int size) {

	struct bitset * result = malloc(sizeof(struct bitset));
	//number of bytes = 8, number of bits in a byte = 8, so word_size = 8*8
	int word_size = sizeof(uint64_t) * 8;
	//size/64 + 1 word if there is a remainder 
	int words =( (size / word_size) + ( ( size % word_size )>0 ));
	result->size_in_words = words;
	result->universe_size = size;
	result->bits = malloc(sizeof(uint64_t) * words);

	//initialising all the bits to 0
	for(int i=0; i< words; i++){
		result->bits[i]=0;
	}
	return result;

}

// get the size of the universe of items that could be stored in the set
int bitset_size(struct bitset * this) {

	return  this->universe_size;
}

// get the number of items that are stored in the set
int bitset_cardinality(struct bitset * this){

	uint64_t old_val;
	uint64_t mask = 1;
	int counter=0;

	for(int i=0; i < this->size_in_words; i++){
		old_val = this->bits[i];

		for(int j=0; j < 64; j++){
			if(((old_val >> j) & mask) == 1){
			  counter++;
			}

		}

	}
	return counter;

}

// check to see if an item is in the set
int bitset_lookup(struct bitset * this, int item){

	//word_size = 64
	int word_size = sizeof(uint64_t) * 8;
	//word is the amount of whole words the the item contains
	int word = item / word_size;
	//bit is the number of bits less then 64 bits, a whole word
	int bit = item % word_size;
	//word is the index for which word we are adding to
	uint64_t old_val = this->bits[word];
	//shift it to the least significant bit
	old_val = old_val >> bit;
	//then we bit and the two, if it's 1 the item is set
	uint64_t mask = 1;
	//returns true or false/ 1 or 0
	return old_val & mask ;


//uint64_t mask = 1ULL << bitnum;
}

// add an item, with number 'item' to the set
// has no effect if the item is already in the set
void bitset_add(struct bitset * this, int item) {

	//word_size = 64 
	int word_size = sizeof(uint64_t) * 8;
	//word is the amount of whole words the item contains
	int word = item / word_size;
	//bit is the number of bits less then 64 bits, a whole word
	int bit = item % word_size;
	//word is the index for which word we are adding to 
	uint64_t old_val = this->bits[word];
	//ULL for unsigned long long
	//mask contains the value we want to add
	uint64_t mask = 1ULL << bit;
	//old_vall or mask to add item
	this->bits[word]=old_val|mask;

}

// remove an item with number 'item' from the set
void bitset_remove(struct bitset * this, int item) {

	//word_size = 64
	int word_size = sizeof(uint64_t) * 8;
	//word is the number of whole words the item contains
	int word = item / word_size;
	//bit is the number of bits less then 64 bits, a whole word
	int bit = item % word_size;
	// old_val is the word before removal
	uint64_t old_val = this->bits[word];
	//for the mask we want all 1 except for postion item, we want a 0
	uint64_t mask = ~(1ULL << bit);
	//old_val and mask to remove item
	this->bits[word]=old_val&mask;
}

// place the union of src1 and src2 into dest;
// all of src1, src2, and dest must have the same size universe
void bitset_union(struct bitset * dest, struct bitset * src1,
    struct bitset * src2){

	uint64_t el1;
	uint64_t el2;
	//go through all of the words 
	for(int i=0; i < src1->size_in_words; i++){
		el1 = src1->bits[i];
		el2 = src2->bits[i];

		dest->bits[i] = el2|el1;

	}
}

// place the intersection of src1 and src2 into dest
// all of src1, src2, and dest must have the same size universe
void bitset_intersect(struct bitset * dest, struct bitset * src1,
    struct bitset * src2) {

	uint64_t el1;
	uint64_t el2;
	//go through all of the words
	for(int i=0; i < src1->size_in_words; i++){
		el1 = src1->bits[i];
		el2 = src2->bits[i];

		dest->bits[i] = el2&el1;


	}
}

