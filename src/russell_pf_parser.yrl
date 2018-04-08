Nonterminals pf stmts stmt symbols symbol.
Terminals atom var ignore ':' ','.
Rootsymbol pf.

pf -> stmt ':' stmts:
  {'$1', '$3'}.

stmts -> stmts stmt ',':
  '$1' ++ ['$2'].

stmts -> '$empty':
  [].

stmt -> symbols ':' atom symbols:
  {mk_symbol('$3'), '$4', '$1'}.

symbols -> symbols symbol:
  '$1' ++ ['$2'].

symbols -> '$empty':
  [].

symbol -> atom:
  mk_symbol('$1').

symbol -> var:
  mk_symbol('$1').

symbol -> ignore:
  mk_symbol('$1').


Erlang code.

mk_symbol({atom, Line, A}) ->
    {A, Line};
mk_symbol({var, Line, V}) ->
    {V, Line};
mk_symbol({ignore, Line}) ->
    {'_', Line}.
