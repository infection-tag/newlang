%{
	#include <stdio.h>
	#include "algo.h"
	#include "newlang.h"
	void yyerror(char*);
	int yylex();
	string* funcnames;
	int funccount = 0;
%}

%token PLUS MINUS TIMES DIV CARROT MOD
%token INT CHAR TREE LINKEDLIST /* datatypes */
%token DISPLAY NEWLINE PRINTERR
%token IS IFSO IFNOT			/* "Is" something "? If So," something */
%token AND NAND OR NOR XOR XNOR	/* Logic gates */
%token EQUALS EQUALSCHECK		/* the difference between = and == */
%token EXPRESSION INTEGER
%token LET FUNC ENDFUNC CLASS
%token INCREM DECREM

%left '+' '-'
%left PLUS MINUS

%%

program:
	   	program statement ';'
		program statement NEWLINE
		|
		;

statement:
		expression							{ ; }
		| INT expression					{ int $2; }
		| CHAR expression					{ char $2; }
		| TREE expression 					{ tree $2; }
		| LINKEDLIST expression				{ LinkedList $2; }
		| DISPLAY expression				{ fprintf(stdout, "%s", $2); }
		| DISPLAY '"' expression '"'		{ fprintf(stdout, "%s", $2); }
		| PRINTERR expression				{ fprintf(stderr, "%s", $2); }
		statement:
		| FUNC INT expression '(' statement ')'
		/* function declaration */	
		{ if(!doesfuncexist(funcnames, $3)) { 
			strcpy(funcnames[funccount], $3);
			int $3 ( $5 ); 
		 } }
		| FUNC INT expression '(' statement ')' ':' statement ENDFUNC
		{ if(!doesfuncexist(funcnames, $3)) {
			strcpy(funcnames[funccount], $3);
			int $3 ( $5 ) {
				$8;
			}
		} }
		NEWLINE
		| expression NEWLINE				{ ; }
		statement
		| statement ',' statement			{  }

expression:
		EXPRESSION
		| expression EQUALS expression			{ $1 = $3; }
		| LET expression EQUALS expression		{ $1 = $3; }
		| expression PLUS expression			{ $$ = $1 + $3; }
		| expression MINUS expression			{ $$ = $1 - $3; }
		| expression TIMES expression			{ $$ = $1 * $3; }
		| expression DIV expression				{ $$ = $1 / $3; }
		| IS expression IFSO statement		
		{ if($2) $4; }
		| IS expression IFSO statement IFNOT statement		
		{ if($2) $4; else $6; }
		| IS expression IFNOT statement			
		{ if(!$2) $4; }		
		| expression EQUALSCHECK expression		{ $$ = $1 == $3; }
		| expression MOD expression				{ $$ = $1 % $3; }
		/* All Logic Gates Begin here */
		| expression AND expression				{ $$ = $1 && $3; }
		| expression OR expression				{ $$ = $1 || $3; }
		| expression XOR expression			
		{ $$ = ((~$1) && $3) || ((~$3) && $1); }
		| expression NAND expression			{ $$ = !($1 && $3); }
		INTEGER
		| expression CARROT expression				{ $$ = $1^$3; }
