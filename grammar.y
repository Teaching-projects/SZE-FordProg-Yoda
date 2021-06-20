%{
    #include <stdio.h>
    int yylex();
    int yyerror(char* message){
        printf("%s\n", message);
        return 1;
    }

%}

%union {
char strval[2048];
int intval;
}

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
%token MAIN ENDMAIN METHOD NONVOIDMETHOD ARGS ENDMETHOD CALLMETHOD  INCLUDE
%token <strval>TYPE <strval>NUMBER

%%

// main token handler
s: main 
    | function s
    | exprs s
    | include s
    | /*empty*/
    ;

// Include handling
include: INCLUDE '\n' STRING {printf("include\n"); /*#include "string"*/}

// Method handling
main: args '\n' MAIN '\n' commands '\n' ENDMAIN {printf("Main function call\n");
/*  Something like this
    void main(args){
        commands
    }

*/
}
    ;
function: args '\n' METHOD STRING '\n' commands '\n' ENDMETHOD
{
    printf("void method call\n");
    /*
        void method_name(args){
            commands
        }
    */
}

        | TYPE '\n' args '\n' NONVOIDMETHOD STRING '\n' commands '\n' ENDMETHOD
        {
            printf("non void method call\n");
            /*
            type string(args){
                commands
            }
            */
        }
        ;

// function argumentum handler
args: TYPE STRING',' args   {printf("type string, \n");}
    | TYPE STRING           {printf("type string\n");}
    ;
// Method handling end

// Common command handling
commands    : command commands
            ;

command:     
             boolexp '\n'  WHILE '\n' command '\n' ENDWHILE { 
                    printf("While\n"); 
                    /*
                    How to check boolexp?
                        while(boolexp){
                            command
                        }
                    */
                 }
            | boolexp '\n' if  {
                printf("if\n");
                /*
                    How to check boolexp?
                    if(boolexp){
                        if_handling
                    }
                */
                }
            | PRINTF STRING 
            { 
                printf("Printf string\n");
                /*
                    printf("string value");
                */ 
            } 
            | RETURN ID {printf("Return id\n"); /*How to return a value here?*/}
            | RETURN NUMBER {printf("return number\n"); /*How to return?*/}
            | exprs 
            | {printf("Empty\n");} 
            ;   

if:         IF '\n' command '\n' ENDIF {printf("If command endf\n");}
            | IF '\n' command '\n' ELSE '\n' command '\n' ENDIF {printf("if command else command endif \n");}
;

// Boolean expression handling start
boolexp:      exprs blx exprs {printf(" boolexp \n"); }
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
calc: exprs token calc {printf("calculation"); /*No idea how to solve this yet*/}
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