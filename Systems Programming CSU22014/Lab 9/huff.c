// code for a huffman coder


#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include "huff.h"


// create a new huffcoder structure
struct huffcoder *  huffcoder_new()
{
    struct huffcoder * result = malloc(sizeof(struct huffcoder));
    assert(result != NULL);
    return result;
}

// count the frequency of characters in a file; set chars with zero
// frequency to one
void huffcoder_count(struct huffcoder * this, char * filename)
{
     FILE * in_file = fopen(filename, "r");
     unsigned char c;
        c = fgetc(in_file);
        while(!feof(in_file)){
                this->freqs[c]++;
                c=fgetc(in_file);
        }

    // run through all the frequencies and if the frequency is 0 then set it to 1 to avoid errors
    for (int i = 0; i < NUM_CHARS; i++) {
        if (this->freqs[i] == 0) {
            this->freqs[i] = 1;
        }
    }
     fclose(in_file);
}

int find_least_freq(struct huffchar ** list, int list_size){
        int min = list[0] -> freq;
        int min_idx = 0;
        int seqno = list[0] -> seqno;
        //go through all the elements in list and update it to min if its less then min
        for(int i=1; i<list_size; i++){
                if((list[i] -> freq < min) || ((list[i] -> freq == min) && (list[i] -> seqno < seqno))){
                //we have a new min
                min = list[i] -> freq;
                min_idx = i;
                seqno = list[i] -> seqno;
                }
        }

        return min_idx;

}

struct huffchar * new_compound(struct huffchar * min1, struct huffchar * min2, int seqno)
{
        struct huffchar * result = malloc(sizeof(struct huffchar));
        assert(result != NULL);
        result -> freq = (min1 -> freq + min2 -> freq);
        result -> is_compound = 1;
        result -> seqno = seqno;
        result -> u.compound.left = min1;
        result -> u.compound.right = min2;
        return result;
}

// using the character frequencies build the tree of compound
// and simple characters that are used to compute the Huffman codes
void huffcoder_build_tree(struct huffcoder * this)
{
        struct huffchar ** list = malloc(sizeof(struct huffchar *) * NUM_CHARS);
        //set up the list of simple chars
        for(int i = 0; i < NUM_CHARS; i++){
                list[i] = malloc(sizeof(struct huffchar));
                assert(list[i] != NULL);
                list[i] -> freq = this->freqs[i];
                list[i] -> is_compound = 0;
                list[i] -> seqno = i;
                list[i] -> u.c = i;
        }

        int list_size = NUM_CHARS;
        int seqno = NUM_CHARS;
        //find and remove the least two freg
        while(list_size > 1){
                //take out the smallest
                int smallest = find_least_freq(list, list_size);
                struct huffchar * min1 = list[smallest];
                list[smallest] = list[list_size - 1];
                smallest = find_least_freq(list, list_size - 1);
                struct huffchar * min2 = list[smallest];
                list[smallest] = list[list_size - 2];
                //create compound char
                struct huffchar * compound;
                compound = new_compound(min1, min2, seqno);
                seqno++;
                list_size--;
                list[list_size - 1] =  compound;

        }

        this -> tree = list[0]; //tree = root of the tree
}

void find_codes_recursive(struct huffchar * current, char * path, int depth, struct huffcoder * this){
        if(current -> is_compound == 1){
                path[depth] = '0';
                find_codes_recursive(current->u.compound.left, path, depth+1, this);
                path[depth] = '1';
                find_codes_recursive(current->u.compound.right, path, depth+1, this);
        }else{ //not a compound char
                int ch = current -> u.c;
                this -> code_lengths[ch] = depth;
                path[depth] = '\0';
                char * result = malloc(sizeof(char) * (this -> code_lengths[ch]+1));
                this -> codes[ch] = strcpy(result, path);

        }
}

// using the Huffman tree, build a table of the Huffman codes
// with the huffcoder object
void huffcoder_tree2table(struct huffcoder * this)
{
        //check that the huffman tree is built
        assert(this->tree != NULL);
        char path[NUM_CHARS];
        int depth = 0;
        find_codes_recursive(this -> tree, path, depth, this);
}


// print the Huffman codes for each character in order;
// you should not modify this function
void huffcoder_print_codes(struct huffcoder * this)
{
  for ( int i = 0; i < NUM_CHARS; i++ ) {
    // print the code
    printf("char: %d, freq: %d, code: %s\n", i, this->freqs[i], this->codes[i]);;
  }
}

// encode the input file and write the encoding to the output file
void huffcoder_encode(struct huffcoder * this, char * input_filename,
    char * output_filename)
{
    FILE * file_in = fopen(input_filename, "r");
    FILE * file_out = fopen(output_filename, "w");
        int c = fgetc(file_in);
        while(feof(file_in) == 0){
                fputs(this -> codes[c], file_out);
                c =fgetc(file_in);
        }
    fputs(this->codes['\x04'], file_out);
    fclose(file_in);
    fclose(file_out);
}

// decode the input file and write the decoding to the output file
void huffcoder_decode(struct huffcoder * this, char * input_filename,
    char * output_filename)
{
    FILE * file_in = fopen(input_filename, "r");
    FILE * file_out = fopen(output_filename, "w");

    // get the size of the input
    fseek(file_in, 0L, SEEK_END);
    int size = ftell(file_in);
    //array of all the bits in the file
    char theCodes [size];
    fseek(file_in, 0L, SEEK_SET);
    fread(theCodes, size, 1, file_in);
    unsigned char c;
    struct huffchar * p = this -> tree; // p points to the root

    int i= 0;
    while( i<size && c != '\x04') {
        c = theCodes[i];
        if(p->is_compound){
            if(c == '0'){
               p = p -> u.compound.left;
            }else{ //it's a '1'
                p = p -> u.compound.right;
            }
           i++;
        }
        else
        { //p points to a leaf
        fputc(p -> u.c, file_out);
        p = this -> tree; // p points to the root
        }
    }
}
