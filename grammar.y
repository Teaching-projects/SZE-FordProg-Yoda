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
include: INCLUDE STRING     // {printf("include\n");}
        | INCLUDE ID        // {printf("include\n"); /*for testing*/}
        ; 


// Method handling
main: args  MAIN  commands  ENDMAIN     { printf("Main function call\n");}
    | MAIN  commands  ENDMAIN           { printf("Main function call\n");}
    | MAIN  ENDMAIN                     { printf("Main function call\n");}
    ;
function: args METHOD STRING commands ENDMETHOD                 { printf("void method call\n"); }
        | TYPE args NONVOIDMETHOD STRING commands ENDMETHOD     { printf("non void method call\n");}
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
             boolexp WHILE  command ENDWHILE        { printf("While\n"); }
            | boolexp if                            { printf("if\n"); }
            | PRINTF STRING                         { printf("Printf string\n");} 
            | RETURN ID                             { printf("Return id\n"); }
            | RETURN NUMBER                         { printf("return number\n"); }
            | calc                                  { printf("calc\n");}
            |                                       { printf("Empty\n");} 
            ;   

if:         IF  commands ENDIF                      {printf("If command endf\n");}
            | IF  commands ELSE  commands ENDIF     {printf("if command else command endif \n");}
;

// Boolean expression handling start
boolexp:    exprs blx exprs {printf("boolexp \n"); }
;

exprs:    ID                {printf("id\n");}
        | NUMBER            {printf("number\n");}
        | BOOL              {printf("bool\n");}
        | STRING            {printf("id string\n"); /*for testing*/}
        ;

blx: EQUALTO        {printf("equalto\n");}
    | GREATERTHAN   {printf("greaterthan\n");}
    | OR            {printf("or\n");}
    | AND           {printf("and\n");}

// Boolean expression handling finish

// Calculation grammar.
calc_exprs:  ID
            | BOOL
            | STRING
;

calc: calc_exprs '=' exprs              {printf("var def\n");}
    | calc_exprs '=' exprs token exprs  {printf("calculation\n");}
    | calc_exprs                        {printf("var def\n");} 
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