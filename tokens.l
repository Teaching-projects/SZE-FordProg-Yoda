%{

    #include "grammar.tab.h"
    #include <cstring>
    #include <iostream>
    using namespace std;
%}

%option noyywrap

DIGITS  [0-9]
ALPHABET [a-zA-Z][a-zA-Z0-9]*
CHARACTERTOKENS [(\)]

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
MY_ALLY_IS_THE_FORCE                    {return PRINTF;}
PERHAPS_NOTHING_IT_IS                   {return EQUALTO;}
POWERFUL_YOU_HAVE_BECOME                {return GREATERTHAN;}
WHAT_WE_KNOW_NOT                        {return OR;}
STRONG_ENOUGH_YOU_ARE_NOT               {return AND;}
SUPRISED                                {return BOOL; /*true*/}
NOT_YET                                 {return BOOL; /*false*/ }
A_JOURNEY_I_MUST_MAKE                   {return MAIN;}
GO_I_WILL                               {return ENDMAIN;}
IF_SO_POWERFUL_YOU_ARE_WHY_LEAVE        {return METHOD;}
BEGUN_THE_CLONE_WAR_HAS                 {return NONVOIDMETHOD;}
I_SENSE_MUCH_FEAR_IN_YOU                {return ARGS;}
NO_MORE_TRAINING_YOU_REQUIRE            {return ENDMETHOD;}
SHOULD_I_CALL_YOU_DARTH_SIDIOUS         {return CALLMETHOD;}
INT                                     {return TYPE;}
STRING                                  {return TYPE;}
FLOAT                                   {return TYPE;}
[1-9]{DIGITS}*                          {return NUMBER;}
{ALPHABET}({ALPHABET}|{DIGITS})*        {return ID;}
{CHARACTERTOKENS}                       {return *yytext;}
[a-zA-Z0-9]*                            {return STRING; }
[ \t]*                                   { /* ignore whitespace */ }
          