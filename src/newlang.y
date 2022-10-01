%{
	#include <stdio.h>
	void yyerror(char*);
	int yylex();
%}

%token PLUS VARIABLE IF
%left '+' '-'
%left "PLUS" "MINUS"

%%

program:
	   	program statement ';'
		program statement NEWLINE
		|
		;

statement:
		expression							{ continue; }
		| 'int' expression					{ int $2; }
		| 'char' expression					{ char $2; }
		| 'tree' expression 				/* implement a default tree */
		{ typedef struct {					/* the tree has two nodes */
			  node* node1;
		  	  node* node2;
		  }
		}
		| 'print' expression				{ printf("%s", $2); }
		| 'display' expression				{ printf("%s", $2); }
		| 'printerr' expression				{ fprintf(stderr, "%s", $2); }
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
		/* exponenets: not to be confused with XOR */
