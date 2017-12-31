#include <stdio.h>
#include "pretty.h"

void prettyEXP(EXP *e)
{
	switch (e->kind) {
		case k_expressionKindIdentifier:
			printf("%s", e->val.identifier);
			break;
		case k_expressionKindIntLiteral:
			printf("%i", e->val.intLiteral);
			break;
		case k_expressionKindAddition:
			printf("(");
			prettyEXP(e->val.binary.lhs);
			printf("+");
			prettyEXP(e->val.binary.rhs);
			printf(")");
			break;
		case k_expressionKindSubtraction:
			printf("(");
			prettyEXP(e->val.binary.lhs);
			printf("-");
			prettyEXP(e->val.binary.rhs);
			printf(")");
			break;
		case k_expressionKindMultiplication:
			printf("(");
			prettyEXP(e->val.binary.lhs);
			printf("*");
			prettyEXP(e->val.binary.rhs);
			printf(")");
			break;
		case k_expressionKindDivision:
			printf("(");
			prettyEXP(e->val.binary.lhs);
			printf("/");
			prettyEXP(e->val.binary.rhs);
			printf(")");
			break;
	}
}

