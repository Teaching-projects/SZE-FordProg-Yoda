
%{
    #include <iostream>
    #include <map>
    #include <string>
    using namespace std;
    int yylex();
    int yyerror(char* message){
        return 1;
    }    

    map<string, int> identifiers;
%}

%token NUMBER ID

%%

commands    : command '\n' commands 
            | /*empty*/
            ;

command     : expression {cout << "Correct input, calculated value: " << $1 << "\n"; }
            | ID '=' NUMBER '\n' { cout << "New ID with value:" << $3 << "\n"; }
            ;

expression  : expression '+' multiplication { $$ = $1 + $3; }
            | expression '-' multiplication { $$ = $1 - $3; }
            | multiplication { $$ = $1; }
            ;

multiplication  : multiplication '*' term   {$$ = $1 * $3;}
                | multiplication '/' term   {$$ = $1 / $3;}
                | term { $$ = $1; }
                ;

term    : '(' expression ')'    { $$ = $2;  }
        | NUMBER                { $$ = $1;  }
        | ID                    { $$ = 0;   }
        ;

%%

int main(){
    if(yyparse() == 0) cout << "<ACC>" << "\n";
    else cout << "ERROR" << "\n";
    return 0;
}