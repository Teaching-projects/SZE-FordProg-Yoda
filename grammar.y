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
%token BOOL
%token MAIN ENDMAIN METHOD NONVOIDMETHOD ARGS ENDMETHOD CALLMETHOD  INCLUDE
%token TYPE NUMBER

%%

// main token handler
s: include s 
    | function s
    | exprs s
    | main s
    | /*empty */
    ;

// Include handling
include: INCLUDE STRING '\n'// {printf("include\n");}
        | INCLUDE ID '\n'// {printf("include\n"); /*for testing*/}
        ; 


// Method handling
main: args '\n' MAIN '\n' commands '\n' ENDMAIN '\n' 
    {
        printf("Main function call\n");
        /*  Something like this
            void main(args){
                commands
            }
        */
    }
    | MAIN '\n' commands '\n' ENDMAIN '\n' 
    {
        printf("Main function call\n");
        /*  Something like this
            void main(){
                commands
            }
        */
    }
    | MAIN '\n' ENDMAIN '\n'
     {
        printf("Main function call\n");
        /*  Something like this
            void main(){
            }
        */
    }
    ;
function: args '\n' METHOD STRING '\n' commands '\n' ENDMETHOD '\n'
{
    printf("void method call\n");
    /*
        void method_name(args){
            commands
        }
    */
}

        | TYPE '\n' args '\n' NONVOIDMETHOD STRING '\n' commands '\n' ENDMETHOD '\n'
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
    | TYPE STRING           {printf("type string \n");}
    | /*can be empty*/         
    ;
// Method handling end

// Common command handling
commands    : command commands
            | /*empty*/
            ;

command:     
             boolexp WHILE '\n' command '\n' ENDWHILE '\n' { 
                    printf("While\n"); 
                    /*
                    How to check boolexp?
                        while(boolexp){
                            command
                        }
                    */
                 }
            | boolexp if  {
                printf("if\n");
                /*
                    How to check boolexp?
                    if(boolexp){
                        if_handling
                    }
                */
                }
            | PRINTF STRING '\n'
            { 
                printf("Printf string\n");
                /*
                    printf("string value");
                */ 
            } 
            | RETURN ID '\n' {printf("Return id\n"); /*How to return a value here?*/}
            | RETURN NUMBER '\n' {printf("return number\n"); /*How to return?*/}
            | calc '\n' 
            | {printf("Empty\n");} 
            ;   

if:         IF '\n' commands '\n' ENDIF '\n' {printf("If command endf\n");}
            | IF '\n' commands '\n' ELSE '\n' commands '\n' ENDIF '\n' {printf("if command else command endif \n");}
;

// Boolean expression handling start
boolexp:      exprs blx exprs {printf("boolexp \n"); }
;

exprs:    ID {printf("id\n");}
        | NUMBER {printf("number\n");}
        | BOOL {printf("bool\n");}
        | STRING {printf("id string\n"); /*for testing*/}
        ;

blx: EQUALTO {printf("equalto\n");}
    | GREATERTHAN {printf("greaterthan\n");}
    | OR {printf("or\n");}
    | AND {printf("and\n");}

// Boolean expression handling finish

// Calculation grammar.
calc_exprs:  ID
            | BOOL
            | STRING
;

calc: calc_exprs '=' exprs {printf("var def\n");}
    | calc_exprs '=' exprs token exprs'\n' {printf("calculation\n"); }
    | calc_exprs {printf("var def\n");} '\n'
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