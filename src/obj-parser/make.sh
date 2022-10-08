bison -y -d newlang.y
flex newlang.l
gcc -c -w newlang.tab.c lex.yy.c
gcc newlang.tab.o lex.yy.o -o ../butter
