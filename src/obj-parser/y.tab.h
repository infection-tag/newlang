/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PLUS = 258,
     MINUS = 259,
     TIMES = 260,
     DIV = 261,
     CARROT = 262,
     MOD = 263,
     INT = 264,
     CHAR = 265,
     TREE = 266,
     LINKEDLIST = 267,
     DISPLAY = 268,
     NEWLINE = 269,
     PRINTERR = 270,
     IS = 271,
     IFSO = 272,
     IFNOT = 273,
     AND = 274,
     NAND = 275,
     OR = 276,
     NOR = 277,
     XOR = 278,
     XNOR = 279,
     EQUALS = 280,
     EQUALSCHECK = 281,
     EXPRESSION = 282,
     INTEGER = 283,
     LET = 284,
     FUNC = 285,
     ENDFUNC = 286,
     CLASS = 287,
     INCREM = 288,
     DECREM = 289
   };
#endif
/* Tokens.  */
#define PLUS 258
#define MINUS 259
#define TIMES 260
#define DIV 261
#define CARROT 262
#define MOD 263
#define INT 264
#define CHAR 265
#define TREE 266
#define LINKEDLIST 267
#define DISPLAY 268
#define NEWLINE 269
#define PRINTERR 270
#define IS 271
#define IFSO 272
#define IFNOT 273
#define AND 274
#define NAND 275
#define OR 276
#define NOR 277
#define XOR 278
#define XNOR 279
#define EQUALS 280
#define EQUALSCHECK 281
#define EXPRESSION 282
#define INTEGER 283
#define LET 284
#define FUNC 285
#define ENDFUNC 286
#define CLASS 287
#define INCREM 288
#define DECREM 289




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

