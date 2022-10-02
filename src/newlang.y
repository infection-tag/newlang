%{
	#include <stdio.h>
	#include "algo.h"
	void yyerror(char*);
	int yylex();
%}

%token PLUS VARIABLE IF
%token INT CHAR TREE LINKEDLIST /* datatypes */
%token DISPLAY NEWLINE
%token IS IFSO IFNOT			/* "Is" something "? If So," something */
%left '+' '-'
%left PLUS MINUS

%%

program:
	   	program statement ';'
		program statement NEWLINE
		|
		;

statement:
		expression							{ continue; }
		| INT expression					{ int $2; }
		| CHAR expression					{ char $2; }
		| TREE expression 					{ tree $2; }
		| DISPLAY expression				{ printf("%s", $2); }
		| PRINTERR expression				{ fprintf(stderr, "%s", $2); }
		NEWLINE
		| expression NEWLINE				{ ; }
		
expression:
		EXPRESSION
		| expression '=' expression				{ $1 = $3; }
		| expression 'EQUALS' expression		{ $1 = $3; }
		| 'LET' expression 'EQUAL' expression	{ $1 = $3; }
		| 'LET' expression 'BE' expression		{ $1 = $3; }
		| expression '+' expression				{ $$ = $1 + $3; }
		| expression 'PLUS' expression			{ $$ = $1 + $3; }
		| expression '-' expression				{ $$ = $1 - $3; }
		| expression 'MINUS' expression			{ $$ = $1 - $3; }
		| expression '*' expression				{ $$ = $1 * $3; }
		| expression 'TIMES' expression			{ $$ = $1 * $3; }
		| 'IS' expression '? IF SO,' statement	{ if($2) $4; else continue; }
		| expression '==' expression			{ $$ = $1 == $3; }
		| expression '%' expression				{ $$ = $1 % $3; }
		/* All Logic Gates Begin here */
		| expression '&&' expression			{ $$ = $1 && $3; }
		| expression 'AND' expression			{ $$ = $1 && $3; }
		| expression '||' expression			{ $$ = $1 || $3; }
		| expression 'OR' expression			{ $$ = $1 || $3; }
		| expression '^^' expression			/* XOR Gate */
		{	 $$ = ((~$1) && $3) || ((~$3) && $1); }
		| expression '^^' expression			/* XOR Gate */
		{ $$ = ((~$1) && $3) || ((~$3) && $1); }
		| expression '!&&' expression			{ $$ = ~($1 && $3); }
		/* All Binary Gates Begin here */
		| expression '&&' expression			{ $$ = $1 && $3; }
		| expression '||' expression			{ $$ = $1 || $3; }
		| expression '^^' expression			/* XOR Gate */
		{ $$ = ((~$1) && $3) || ((~$3) && $1); }
		| expression '!&&' expression			{ $$ = ~($1 && $3); }
		INTEGER
		| expression '^' expression				{ $$ = $1^$3; }
