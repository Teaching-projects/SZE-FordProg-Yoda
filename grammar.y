%{
    #include <stdio.h>
    int yylex();
    int yyerror(char* message){
        return 1;
    }

%}


%token IF 
%token ENDIF 
%token ELSE 
%token WHILE 
%token ENDWHILE 
%token RETURN 
%token PRINTF 
%token OR 
%token AND 
%token EQUALTO 
%token GREATERTHAN 
%token ID 
%token STRING 
%token NUMBER 
%token BOOL

%%

commands    :   commands command
            |   /*empty*/
            ;

command:    boolexp {printf("Boolexp\n");}
             |  '(' boolexp ')' WHILE  command ENDWHILE { printf("While\n"); }
            | '(' boolexp ')' if    {printf("if\n");}
            | PRINTF STRING { printf("Printf string\n"); } 
            | RETURN ID ';' {printf("Return id\n");}
            | RETURN NUMBER ';'{printf("retunr number\n");}
            | {printf("Empty\n");}
            ;   

if:         IF command  ENDIF {printf("If command endf\n");}
            | IF  command  ELSE  command  ENDIF {printf("if command else command endif \n");}
;

boolexp: ID EQUALTO NUMBER          {printf("ID EQUALTO NUMBER\n");} 
            | NUMBER EQUALTO ID     {printf("NUMBER EQUALTO ID\n");}
            | ID EQUALTO ID         {printf("ID EQUALTO ID\n");}
            | NUMBER EQUALTO NUMBER {printf("NUMBER EQUALTO NUMBER\n");}
            | ID GREATERTHAN NUMBER {printf("ID GREATERTHAN NUMBER\n");}
            | NUMBER GREATERTHAN ID {printf("NUMBER GREATERTHAN ID\n");}
            | ID OR NUMBER          {printf("ID OR NUMBER\n");}
            | NUMBER OR ID          {printf("NUMBER OR ID\n");}
            | ID AND NUMBER         {printf("ID AND NUMBER\n");}
            | NUMBER AND ID         {printf("NUMBER AND ID\n");}
            |
;

/* expression: expression '+' multiplication 
            | expression '-' multiplication 
            | multiplication 
            ; */

/* multiplication: multiplication '*' term 
               | multiplication '/' term 
               | term 
               ; */
 
;

%%

int main(){
    int result  = yyparse();
    if (result == 0) printf("<ACC>\n");
    else printf("DISOBEYING THE COUNCIL YOUR EXPERTISE IS (ERROR: %d)\n", result);
    return 0;
}