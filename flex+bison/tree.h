#ifndef TREE_H
#define TREE_H

typedef enum {
	k_expressionKindIdentifier,
	k_expressionKindIntLiteral,
	k_expressionKindAddition,
	k_expressionKindSubtraction,
	k_expressionKindMultiplication,
	k_expressionKindDivision
} ExpressionKind;

typedef struct EXP EXP;
struct EXP {
	int lineno;
	ExpressionKind kind;
	union {
		char *identifier;
		int intLiteral;
		struct { EXP *lhs; EXP *rhs; } binary;
	} val;
};

EXP *makeEXP_identifier(char *id);
EXP *makeEXP_intLiteral(int intLiteral);
EXP *makeEXP_binary(ExpressionKind op, EXP *lhs, EXP *rhs);

#endif /* !TREE_H */

