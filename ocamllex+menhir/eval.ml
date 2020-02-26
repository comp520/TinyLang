open Tree

let rec eval_exp (e: exp) =
  match e with
  | Identifier (_, line) -> failwith ("(line " ^ string_of_int line ^ ") Cannot evaluate the value of an identifier\n")
  | IntLiteral (v, _) -> v
  | Binary (lhs, rhs, op) -> eval_binary_exp lhs rhs op
and eval_binary_exp (lhs: exp) (rhs: exp) (op: operator) =
  match op with
  | Plus -> eval_exp lhs + eval_exp rhs
  | Minus -> eval_exp lhs - eval_exp rhs
  | Mult -> eval_exp lhs * eval_exp rhs
  | Div -> eval_exp lhs / eval_exp rhs
;;

let eval_program (prog: program) =
  match prog with
  | Program e -> eval_exp e
;;