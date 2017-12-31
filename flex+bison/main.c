#include <stdio.h>
#include "tree.h"
#include "pretty.h"
#include "eval.h"

void yyparse();

EXP *root;

int main()
{
	printf("Enter a \"TinyLang\" expression followed by Ctrl-d:\n");

	yyparse();

	int result = evalEXP(root);
	printf("\nEvaluation: ");
	prettyEXP(root);
	printf(" = %d\n", result);

	return 0;
}
