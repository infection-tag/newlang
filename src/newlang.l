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

"ll"		{
				return LINKEDLIST;
			}

"int"		{
				return INT;
			}

"="			{
				return EQUALS;
			}

"EQUAL",
"be",
"BE",
"equal",
"EQUALS"	{
				return EQUALS;
			}

"+", "PLUS",
"plus"		{
				return PLUS;
			}

"-", 
"MINUS",
"minus"		{
				return MINUS;
			}

"*",
"TIMES",
"times"		{
				return TIMES;
			}

"/",
"BY", "by",
"divided by",
"div"		{ 
				return DIV;
			}

"++",
"pp",
"plusplus"	{
				return INCREM;
			}

"let",
"Let",
"LET"		{
				return LET;
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

"if not,",
"if not",
"If not,",
"If not",
"IF NOT,",
"IF NOT"	{
				return IFNOT;
			}

"printerr",
"Printerr",
"PRINTERR"	{
				return PRINTERR;
			}

"=="		{
				return EQUALSCHECK;
			}

"^^",
"xor",
"XOR"		{
				return XOR;
			}

"xnor",
"!^^",
"XNOR"		{
				return XNOR;
			}

"and",
"&&",
"AND"		{
				return AND;
			}

"nand",
"!&&",
"NAND"		{
				return NAND;
			}

"or",
"||",
"OR"		{
				return OR;
			}

"nor",
"!||",
"NOR"		{
				return NOR;
			}

"^",
"**",		{	/* supports both x**3 and x^3 for cubing */
				return CARROT;
			}

[%]			{
				return MOD;
			}

.			{
				return yyval = *yytext - 'a';
			}
