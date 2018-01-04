#include <stdio.h>
#include <stdlib.h>
#include "eval.h"

int evalEXP(EXP *e)
{
	switch (e->kind) {
		case k_expressionKindIdentifier:
			fprintf(stderr, "Error: (line %d) Cannot evaluate the value of an identifier\n", e->lineno);
			exit(1);
		case k_expressionKindIntLiteral:
			return e->val.intLiteral;
		case k_expressionKindAddition:
			return evalEXP(e->val.binary.lhs) + evalEXP(e->val.binary.rhs);
		case k_expressionKindSubtraction:
			return evalEXP(e->val.binary.lhs) - evalEXP(e->val.binary.rhs);
		case k_expressionKindMultiplication:
			return evalEXP(e->val.binary.lhs) * evalEXP(e->val.binary.rhs);
		case k_expressionKindDivision:
			return evalEXP(e->val.binary.lhs) / evalEXP(e->val.binary.rhs);
		default: 
			fprintf(stderr, "Error: (line %d) Unknown kind for an expression node\n", e->lineno);
			exit(1);
	}
}
