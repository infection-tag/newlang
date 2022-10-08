#include <stdio.h>

/* prepro.c: the butter preprocessor. Puts preprocessor directives 
 * into separate parser for easier workings. All the code will be put
 * into a /tmp/FILENAME.bobj file. (bobj is butter object). */

int main(int argc, char** argv) {

	/* check if there even is an input file. */
	if(argc == 0) {
		printf("PREPROCESSOR ERROR: no targets specified and no input file passed in.\n");
		return -1;
	}

	char* input = argv[0][0];
	FILE* input_file = fopen(input);

	if(input_file == NULL) {
		printf("PREPROCESSOR ERROR: input file is invalid. Opening file failed.\n");
		return -1;
	}

	
