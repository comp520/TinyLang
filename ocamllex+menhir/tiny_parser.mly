%{

%}

%token EOFt
%token LPARENt RPARENt
%token PLUSt MINUSt MULTt DIVt
%token <int * int> INTVALt
%token <string * int> IDENTIFIERt

%left PLUSt MINUSt
%left MULTt DIVt

%start <Tree.program> program


%%
program: exp EOFt         { Tree.Program $1 };

exp:  IDENTIFIERt         { Tree.Identifier (fst $1, snd $1) }
    | INTVALt             { Tree.IntLiteral (fst $1, snd $1) }
    | LPARENt exp RPARENt { $2 }
    | exp MULTt exp       { Tree.Binary ($1, $3, Tree.Mult) }
    | exp DIVt exp        { Tree.Binary ($1, $3, Tree.Div) }
    | exp PLUSt exp       { Tree.Binary ($1, $3, Tree.Plus) }
    | exp MINUSt exp      { Tree.Binary ($1, $3, Tree.Minus) }
;
