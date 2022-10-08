#ifndef NEWLANG_H
#define NEWLANG_H

#include <string.h>
#include <stdio.h>

#ifndef true
#define false 0
#define true !false
#endif

typedef char* string;

int doesfuncexist(string* funcnames, char* newfunc) {
	int i = 0;
	for(i = 0; funcnames[i] != NULL; i++) {
		if(strcmp(funcnames[i], newfunc))
			return true;
	}
	return false;
}

#endif /* NEWLANG_H */
