CC = gcc

CFLAGS = -Wall

main: parser.tab.o lex.yy.o main.o tree.h tree.o pretty.h pretty.o eval.h eval.o
	$(CC) lex.yy.o parser.tab.o tree.o pretty.o eval.o main.o -o tiny -lfl

parser.tab.c parser.tab.h: tiny.y
	bison --yacc --defines=parser.tab.c --output=parser.tab.h tiny.y

lex.yy.c: tiny.l parser.tab.h
	flex tiny.l
check:
	./check
clean:
	rm parser.tab.* lex.yy.*; rm *.o; rm tiny result
