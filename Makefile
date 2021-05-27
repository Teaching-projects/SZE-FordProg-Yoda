a.out: lex.yy.c grammer.tab.c grammer.tab.h
	g++ lex.yy.c grammer.tab.c

lex.yy.c: tokens.l
	flex tokens.l

grammer.tab.c grammer.tab.h: grammer.y
	bison -d grammer.y