%{
#include <stdio.h>
#include <stdlib.h>

#include "tree.h"

extern int yylineno;
extern EXP *root;

int yylex();
void yyerror(const char *s) { fprintf(stderr, "Error: (line %d) %s\n", yylineno, s); exit(1); }
%}

%locations
%error-verbose

%code requires
{
	#include "tree.h"
}

%union {
	int int_val;
	char *string_val;
	EXP *exp;
}

%type <exp> program exp

%token <int_val> tINTVAL
%token <string_val> tIDENTIFIER 

%left '+' '-'
%left '*' '/'

%start program

%% 
program: exp { root = $1; }
       ;

exp : tIDENTIFIER { $$ = makeEXP_identifier($1); }
    | tINTVAL     { $$ = makeEXP_intLiteral($1); }
    | exp '*' exp { $$ = makeEXP_binary(k_expressionKindMultiplication, $1, $3); }
    | exp '/' exp { $$ = makeEXP_binary(k_expressionKindDivision, $1, $3); }
    | exp '+' exp { $$ = makeEXP_binary(k_expressionKindAddition, $1, $3); }
    | exp '-' exp { $$ = makeEXP_binary(k_expressionKindSubtraction, $1, $3); }
    | '(' exp ')' { $$ = $2; }
    ;

%%
