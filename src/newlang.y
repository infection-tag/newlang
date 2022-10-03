%{
	#include <stdio.h>
	#include "algo.h"
	void yyerror(char*);
	int yylex();
%}

%token PLUS MINUS TIMES DIV CARROT MOD
%token INT CHAR TREE LINKEDLIST /* datatypes */
%token DISPLAY NEWLINE PRINTERR
%token IS IFSO IFNOT			/* "Is" something "? If So," something */
%token AND NAND OR NOR XOR XNOR	/* Logic gates */
%token EQUALS EQUALSCHECK		/* the difference between = and == */
%token EXPRESSION INTEGER
%token LET
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
		| LINKEDLIST expression				{ LinkedList $2; }
		| DISPLAY expression				{ printf("%s", $2); }
		| PRINTERR expression				{ fprintf(stderr, "%s", $2); }
		NEWLINE
		| expression NEWLINE				{ ; }

expression:
		EXPRESSION
		| expression EQUALS expression			{ $1 = $3; }
		| LET expression EQUALS expression		{ $1 = $3; }
		| expression PLUS expression			{ $$ = $1 + $3; }
		| expression MINUS expression			{ $$ = $1 - $3; }
		| expression TIMES expression			{ $$ = $1 * $3; }
		| expression DIV expression				{ $$ = $1 / $3; }
		| IS expression IFSO statement		
		{ if($2) $4; else continue; }
		| IS expression IFSO statement IFNOT statement		
		{ if($2) $4; else $6; }
		| IS expression IFNOT statement			
		{ if(!$2) $4; else continue; }		
		| expression EQUALSCHECK expression		{ $$ = $1 == $3; }
		| expression MOD expression				{ $$ = $1 % $3; }
		/* All Logic Gates Begin here */
		| expression AND expression				{ $$ = $1 && $3; }
		| expression OR expression				{ $$ = $1 || $3; }
		| expression XOR expression			
		{ $$ = ((~$1) && $3) || ((~$3) && $1); }
		| expression NAND expression			{ $$ = ~($1 && $3); }
		/* All Binary Gates Begin here */
		| expression '!&&' expression			{ $$ = ~($1 && $3); } 
		INTEGER
		| expression CARROT expression				{ $$ = $1^$3; }
