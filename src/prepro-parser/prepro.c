#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NEUTRAL 0
#define IMPORT 1

/* prepro.c: the butter preprocessor. Puts preprocessor directives 
 * into separate parser for easier workings. All the code will be put
 * into a /tmp/FILENAME.bobj file. (bobj is butter object). */

int main(int argc, char** argv) {

	int no_of_imports; /* stops recursive parser if no *
						* more "imports" are included. */

	/* check if there even is an input file. */
	if(argc == 0) {
		printf("PREPROCESSOR ERROR: no targets specified and no input file passed in.\n");
		return -1;
	}

	char* input = argv[0][0];
	FILE* input_file = fopen(input, "r");

	if(input_file == NULL) {
		printf("PREPROCESSOR ERROR: input file is invalid. Opening file failed.\n");
		return -1;
	}

	fclose(input_file); /* will be re-opened later for appending */

	int state;
	char* current;
	char* buffer;
	FILE* temp_file;
	char temp_char;
	for(; current != EOF; current = fgets(input_file)) {
		if(strcmp(current, "import") == 0) { /* usage: import [filename] */
			state = IMPORT;
		}

		else if(state == IMPORT) {
			for(; current != '\n'; current = fgets(input_file))
				buffer = strcat(buffer, current); 
				/* supports multi-word filenames */
			temp_file = fopen(buffer);
			input_file = fopen(input, "a");
			
			for(temp_char = fgetc(temp_file); temp_char != EOF; \
						   	temp_char = fgetc(temp_file))
					fprintf(input_file, temp_char);
			
			fclose(temp_file);
			state = NEUTRAL; /* import has completed; continue parsing */
		}
	}
}
