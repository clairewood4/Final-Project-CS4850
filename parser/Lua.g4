grammar Lua;

program :
        chunk EOF
        ;

chunk :
        block
        ;

block :
        expression* retstat?
        ;

expression :
                  expression MULT expression     
                | expression DIV expression     
                | expression ADD expression     
                | expression SUB expression     
                | expression EQ expression 
                | expression OR expression
                | expression AND expression
                | NOT expression 
                | ifExpr          
        ;

ifExpr:
        IF expression THEN block (ELSEIF expression THEN block)+ (ELSE block) 'end' 
        ;

retstat :
        'return' explist? SEMI?
        ;
    
explist : 
        exp (',' exp)*
        ;


exp :
        | TRUE 
        | FALSE
        | INT
        | FLOAT
        | STRING
        | functiondef
        ;

fragment                
ALPHA : [a-zA-Z]
      ;

fragment
DIGIT : [0-9]
      ;

ID : ALPHA (ALPHA | DIGIT)*
   ;

fragment
POSITIVE : [1-9]
         ;
INT : (POSITIVE DIGIT* | '0')
;

fragment
EXPONENT : ('e' | 'E') ('+' | '-')? DIGIT+
         ;

FLOAT : INT '.' DIGIT+ EXPONENT?
         ;

STRING : '\'' ( ~[\\'] )*? '\'' ;

functiondef:
        FUNCTION funcbody
       ;

funcbody:
    LP parlist RP block END
    ;

parlist:
    namelist (',' '...')?
    | '...'
    |
    ;

namelist:
    STRING (',' STRING)*
    ;



END         : 'end';
FUNCTION    : 'function';
SEMI        : ';';
ADD         : '+';
SUB         : '-';
MULT        : '*';
DIV         : '/';
EQ          : '==';
FDIV        : '//';

ASSIGN      :  '=';

AND         :  'and';
OR          :  'or';
NOT         :  'not';


IF          :  'if';
THEN        :  'then';
ELSEIF      :  'elif';
ELSE        :  'else';


TRUE        : 'true';
FALSE       : 'false';

LP          : '(';
RP          : ')';
LB          : '{';
RB          : '}';
LK          : '[';
RK          : ']';
DOT         : '.';
COMMA       : ',';
COLON       : ':';


