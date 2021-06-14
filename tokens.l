%{

    #include "grammar.tab.h"
    #include <cstring>
    #include <iostream>
    using namespace std;
%}

%option noyywrap

DIGITS  [0-9]*
ALPHABET [a-zA-Z][a-zA-Z0-9]*

%% 

exit                                    {return '\0';}
\n                                      {return '\n';}
SIZE_MATTERS_NOT                        {return '+';}
RUSH_NOT_INTO_FIGHTS                    {return '-';}
DIFFICULT_TO_SEE                        {return '*';}
YOU_ARE_RECKLESS                        {return '/';}
WARS_NOT_MAKE_ONE_GREATE                {return '=';}
STRAIGHT_PATH_WE_WILL_NOT_FOLLOW        {return IF;}
DO_OR_DO_NOT                            {return ENDIF;}
THE_GREATEST_TEACHER_FAILURE_IS         {return ELSE;}
HURRY_WE_MUST                           {return WHILE;}
ATTACHMENT_LEADS_TO_JEALOUSY            {return ENDWHILE;}
PASS_ON_WHAT_YOU_HAVE_LEARNED           {return RETURN;}
MY_ALLY_IS_THE_FORCE                    { return PRINTF;}
PERHAPS_NOTHING_IT_IS                   {return EQUALTO;}
POWERFUL_YOU_HAVE_BECOME                {return GREATERTHAN;}
WHAT_WE_KNOW_NOT                        {return OR;}
STRONG_ENOUGH_YOU_ARE_NOT               {return AND;}
SUPRISED                                {yylval.value = 1; return BOOL;}
NOT_YET                                 {yylval.value = 0; return BOOL;}
{DIGITS}                                {yylval.value = atoi(yytext); return NUMBER;    }
{ALPHABET}({ALPHABET}|{DIGITS})*        {strcpy(yylval.name,yytext); return ID;}
[ \t]                                   { /* ignore whitespace */ }
          