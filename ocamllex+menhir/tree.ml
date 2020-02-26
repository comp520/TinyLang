type operator =
  | Plus
  | Minus
  | Mult
  | Div
;;

type exp =
  (* id string, line number *)
  | Identifier of string * int
  (* literal value, line number *)
  | IntLiteral of int * int
  (* lhs, rhs, operator *)
  | Binary of exp * exp * operator
;;

type program =
  Program of exp
;;