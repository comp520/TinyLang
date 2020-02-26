open Tree

let rec pretty_exp (e: exp) =
  match e with
  | Identifier (id, _) -> print_string id
  | IntLiteral (v, _) -> print_string (string_of_int v)
  | Binary (lhs, rhs, op) -> pretty_binary_exp lhs rhs op
and pretty_binary_exp (lhs: exp) (rhs: exp) (op: operator) =
  match op with
  | Plus ->
    print_string "(";
    pretty_exp lhs;
    print_string " + ";
    pretty_exp rhs;
    print_string ")"
  | Minus ->
    print_string "(";
    pretty_exp lhs;
    print_string " - ";
    pretty_exp rhs;
    print_string ")"
  | Mult ->
    print_string "(";
    pretty_exp lhs;
    print_string " * ";
    pretty_exp rhs;
    print_string ")"
  | Div ->
    print_string "(";
    pretty_exp lhs;
    print_string " / ";
    pretty_exp rhs;
    print_string ")"
;;

let pretty_program (prog: program) =
  match prog with
  | Program e -> pretty_exp e; print_string "\n"
;;