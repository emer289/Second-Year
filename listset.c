#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

// include the header files with the declarations of listset
#include "listset.h"

struct listset * listset_new() {
        struct listset * result;
        result = malloc(sizeof(struct listset));
        //assert(result != NULL); //check that memory has been alocated 
        result -> head = NULL;
        return result;
}

/* check to see if an item is in the set
   returns 1 if in the set, 0 if not */
int listset_lookup(struct listset * this, char * item) {
        struct listnode * p;
        //p -> to the head of this; if this is not empty; 
        //p moves to the next node
        for(p = this -> head; p != NULL; p = p -> next){
                if(strcmp(p -> str, item) == 0){
                        return 1; //string is found yay!
                }
        }
        return 0;
}

void listset_add(struct listset * this, char * item) {
        //if item is not in the list already 
        if(listset_lookup(this, item) == 0){
                //we insert the item at the start of the list
                struct listnode * new_node;
                new_node = malloc(sizeof(struct listnode));
                new_node -> str = item;
                //in the list we make new_node first and head of the 
                //list second
                new_node -> next = this -> head;
                //make head point to the first node, new_node
                this -> head = new_node;
        }
}

void listset_remove(struct listset * this, char * item) {
	//check that the item is in the list
	if(listset_lookup(this, item) == 1){
		//find it
		struct listnode * p = this -> head;
		struct listnode * prev = NULL; //node pointing to the p0's prev node

		for(; p != NULL; prev = p, p = p -> next){
			if(strcmp(p -> str, item) == 0){
				if(prev == NULL){
				//if the item in at the begining of the list
					this -> head = p -> next;
					free(p);
			}else{
				prev -> next = p -> next;
				free(p);
			}
		}
          }

	}
}

// place the union of src1 and src2 into dest
void listset_union(struct listset * dest, struct listset * src1,
  struct listset * src2) {
                struct listnode * src1_p = src1 -> head;
                struct listnode * src2_p = src2 -> head;

                for (src1_p = src1 -> head; src1_p != NULL; src1_p = src1_p -> next ) //add a to the dest list
                {
                                listset_add( dest, src1_p -> str);

                }

                //add elements in b if they are not in a
                for (src2_p = src2 -> head; src2_p != NULL; src2_p = src2_p -> next )
                {
                        if(listset_lookup( dest , src2_p -> str) == 0){ //not in a
                                listset_add(dest, src2_p -> str);
                        }
                }
}

// place the intersection of src1 and src2 into dest
void listset_intersect(struct listset * dest, struct listset * src1,
  struct listset * src2) {
        struct listnode * src1_p = src1 -> head;
        struct listnode * src2_p = src2 -> head;

        for(; src1_p != NULL; src1_p = src1_p -> next){//loops through the first set
                for (src2_p = src2 -> head; src2_p != NULL; src2_p = src2_p -> next )//loops through the second set
                {
                        if(listset_lookup( src1, src2_p -> str) ){//checks for intersection
                                listset_add(dest, src1_p -> str); //element is added to the list dest
                        }
                }
        }
}

// return the number of items in the listset
int listset_cardinality(struct listset * this) {
        int counter = 0;
        struct listnode * p;

        if(this -> head == NULL){
                return 0;   //list is empty
        }else{

                for(p = this -> head; p != NULL; p = p -> next){
                        counter++;                }
                return counter;
        }
}

// print the elements of the list set
void listset_print(struct listset * this) {
  struct listnode * p;
  for ( p = this->head; p != NULL; p = p->next ) {
    printf("%s, ", p->str);
  }
  printf("\n");
}
