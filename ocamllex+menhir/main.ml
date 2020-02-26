print_endline "Enter a \"TinyLang\" expression followed by Ctrl-d:";
let lexbuf = Lexing.from_channel stdin in
try
  let prog = Tiny_parser.program Tiny_lexer.token lexbuf in
    print_string "Pretty print: ";
    Pretty.pretty_program prog;
    let evaluated_val = Eval.eval_program prog in
      print_endline ("Evaluated value: " ^ string_of_int evaluated_val)
with
  | Tiny_parser.Error -> print_endline "Parse error"
  | Failure msg -> print_endline ("Error: " ^ msg)