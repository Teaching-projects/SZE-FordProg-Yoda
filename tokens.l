%{
    #include "grammer.tab.h"
    #include <iostream>
    using namespace std;
%}

%option noyywrap

DIGITS          [0-9]
ALPHABET        [a-zA-Z]
CHARACTERTOKENS [\+\-\*\/\(\)=]

%%

exit                                        return '\0';
{CHARACTERTOKENS}                           cerr << "LOOKAHEAD:" << yytext << "\n"; return *yytext;
[1-9]{DIGITS}*                              yylval=atoi(yytext); cerr << "LOOKAHEAD: NUMBER (" << yylval << ")" << "\n";  return NUMBER;
\n                                          return '\n';
{ALPHABET}({ALPHABET}|{DIGITS})*            cerr << "LOOKAHEAD: ID("<< yytext << ")" << "\n"; return ID;
[ \t]*                                      /*skip*/

%%