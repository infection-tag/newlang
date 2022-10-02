%{
	#include "y.tab.h"
	#include "algo.h"
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

"ll"		{
				return LINKEDLIST;
			}

"int"		{
				return INT;
			}

[=]			{
				return EQUALS;
			}

"equal",
"EQUALS"
"=="		{
				return EQUALS;
			}

"print",
"DISPLAY",
"display",
"PRINT"		{
				return DISPLAY;
			}

"is",
"Is",
"IS"		{
				return IS;
			}

"? If so,",
"? If so",
"? if so,",
"? if so",
"? IF SO,",
"? IF SO"	{
				return IFSO;
			}

"PRINTERR"	{
				return PRINTERR;
			}

"=="		{
				return EQUALSEQUALS;
			}

.			{
				return EXPRESSION;
			}
