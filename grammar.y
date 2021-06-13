%{
    #include <iostream>
    #include <map>
    #include <string>
    using namespace std;
    int yylex();
    int yyerror(char* message){
        return 1;
    }
    map<string,int> identifiers;
%}

%union{
    int value;
    char name[16];
}

%token IF ENDIF ELSE WHILE ENDWHILE RETURN PRINTF EQUALTO GREATERTHAN OR AND
%token<value> NUMBER
%token<name> ID STRING

%type<value> term multiplication expression 

%%

commands    :   commands command
            |   /*empty*/
            ;

command:    boolexp 
            |  '(' boolexp ')' while
            | '(' boolexp ')' if
            | PRINTF STRING {printf("%s"), $2};
            | RETURN ID ';'
            | RETURN NUMBER ';'
            | expression 
            ;   

while: WHILE  command ENDWHILE 
;

if:         IF command  ENDIF 
            | IF  command  ELSE  command  ENDIF
;

boolexp: ID EQUALTO NUMBER       {$1 == $3} // Probably here need something more...
            | NUMBER EQUALTO ID     {$1 == $3}
            | ID GREATERTHAN NUMBER {$1 > $3}
            | NUMBER GREATERTHAN ID {$1 > $3}
            | ID OR NUMBER          {$1 || $3}
            | NUMBER OR ID          {$1 || $3}
            | ID AND NUMBER         {$1 && $3}
            | NUMBER AND ID         {$1 && $3}

;

expression: expression '+' multiplication { $$= $1 + $3; }
            | expression '-' multiplication { $$= $1 - $3; }
            | multiplication { $$= $1; }
            ;

multiplication: multiplication '*' term { $$= $1 * $3; }
               | multiplication '/' term { $$= $1 / $3; }
               | term { $$ = $1; }
               ;
 
;

term: '(' expression ')' { $$ = $2; }
     | NUMBER { $$ = $1; }
     ;
%%



void yyerror(char * s)
/* yacc error handler */
{  
 fprintf (stderr, "%s\n", s);
}

int main(){
    int result  = yyparse();
    if (result == 0) cout<<"<ACC>\n";
    else cout<<"DISOBEYING THE COUNCIL YOUR EXPERTISE IS (ERROR: " << result << ")" <<endl;
    return 0;
}