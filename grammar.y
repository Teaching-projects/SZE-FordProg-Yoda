%{
    #include <stdio.h>
    int yylex();
    int yyerror(char* message){
        printf("%s\n", message);
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
%token MAIN ENDMAIN METHOD NONVOIDMETHOD ARGS ENDMETHOD CALLMETHOD TYPE

%%

// Method handling
main: args '\n' MAIN '\n' commands '\n' ENDMAIN {printf("Main function call\n");};
    | /*empty*/

function: args '\n' METHOD '\n' commands '\n' ENDMETHOD
        | TYPE '\n' args '\n' NONVOIDMETHOD '\n' commands '\n' ENDMETHOD
        | /*empty*/
        | ;

args: ARGS 
// Method handling end

// Common command handling
commands    : command commands
            ;

command:     
             boolexp '\n'  WHILE '\n' command '\n' ENDWHILE { printf("While\n"); }
            | boolexp '\n' if  {printf("if\n");}
            | PRINTF STRING { printf("Printf string\n"); } 
            | RETURN ID {printf("Return id\n");}
            | RETURN NUMBER {printf("return number\n");}
            | exprs
            | {printf("Empty\n");} 
            ;   

if:         IF '\n' command '\n' ENDIF {printf("If command endf\n");}
            | IF '\n' command '\n' ELSE '\n' command '\n' ENDIF {printf("if command else command endif \n");}
;

// Boolean expression handling start
boolexp:      exprs blx exprs {printf(" boolexp \n");}
;

exprs:    ID {printf("id\n");}
        | NUMBER {printf("number\n");}
        | BOOL {printf("bool\n");}
        ;

blx: EQUALTO {printf("equalto\n");}
    | GREATERTHAN {printf("greaterthan\n");}
    | OR {printf("or\n");}
    | AND {printf("and\n");}

// Boolean expression handling finish

// Calculation grammar.
calc: exprs token calc
    | exprs
    ;

token: '+'
        | '-'
        | '*'
        | '/'
        ;

%%

int main(){
    int result  = yyparse();
    if (result == 0) printf("<ACC>\n");
    else printf("DISOBEYING THE COUNCIL YOUR EXPERTISE IS (ERROR: %d)\n", result);
    return 0;
}