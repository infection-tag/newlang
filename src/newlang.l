%{
	#include "y.tab.h"
	#include <stdlib.h>
	void yyerror(char*);
%}

%%

[0-9]		{
				yyval = *yytext - 'a';
				return INTEGER;
			}

[ \t\n]		; /* skip whitespace, newline, tabspace */

[;]			{ 
				return NEWLINE;
			}

.			{
				return EXPRESSION;
			}
