{
  open Tiny_parser
  open Lexing

  (* Get the text of the current buffer *)
  let get_text = Lexing.lexeme
  let get_line_num buf = let p = buf.lex_curr_p in p.pos_lnum
  
}
  (* Helper regex definitions *)
  let letter = ['a'-'z' 'A'-'Z']
  let digit = ['0'-'9']

  let identifier = ((letter | '_') (letter | digit | '_')*)

rule token = parse
  | eof                         { EOFt }
  | (' ' | '\t' | '\n' | '\r')  { token lexbuf }

  | '('                         { LPARENt }
  | ')'                         { RPARENt }

  | '+'                         { PLUSt }
  | '-'                         { MINUSt }
  | '*'                         { MULTt }
  | '/'                         { DIVt }

  | identifier                  { IDENTIFIERt (get_text lexbuf, get_line_num lexbuf) }
  | ('0' | ['1'-'9']digit*)     { INTVALt (int_of_string (get_text lexbuf), get_line_num lexbuf) }
  
  | _                           { failwith ("(line " ^ (string_of_int (get_line_num lexbuf)) ^ ") Unexpected char '" ^ (get_text lexbuf) ^ "'") }