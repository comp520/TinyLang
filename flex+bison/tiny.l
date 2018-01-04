%{
#include <stdio.h>
#include <string.h>

#include "parser.tab.h"
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
%}

%option yylineno
%option noinput
%option nounput

%%

[ \t\n\r]+

"*"     return '*';
"/"     return '/';
"+"     return '+';
"-"     return '-';
"("     return '(';
")"     return ')';

0|([1-9][0-9]*) {
	yylval.int_val = atoi(yytext);
	return tINTVAL;
}

[a-zA-Z_][a-zA-Z0-9_]* { 
	yylval.string_val = strdup(yytext);
	return tIDENTIFIER;
}

.       { fprintf(stderr, "Error: (line %d) unexpected character '%s'\n", yylineno, yytext); exit(1); }

%%
