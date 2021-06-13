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
%token<name> ID

%type<value> term multiplication expression 

%%

commands    :   commands command
            |   /*empty*/
            ;

command:    expression 
            | '(' expression ')' IF '{' command '}' ENDIF
            | '(' expression ')' IF '{' command '}' ELSE '{' command '}' ENDIF
            | '(' expression ')' WHILE '{' command '}' ENDWHILE
            | PRINTF {printf("")}
            | RETURN expression ';'
            ;   

condition: ;

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