# YODAC

## Commands

False					-> NOT_YET
True 					-> SUPRISED

If 					    -> STRAIGHT_PATH_WE_WILL_NOT_FOLLOW 
EndIf					-> DO_OR_DO_NOT
Else					-> THE_GREATEST_TEACHER_FAILURE_IS 

While					-> HURRY_WE_MUST 
EndWhile				-> ATTACHMENT_LEADS_TO_JEALOUSY

PlusOperator			-> SIZE_MATTERS_NOT
MinusOperator			-> RUSH_NOT_INTO_FIGHTS
MultilicationOperator	-> DIFFICULT_TO_SEE
DivisionOperator		-> YOU_ARE_RECKLESS

EqualTo					-> PERHAPS_NOTHING_IT_IS
GreaterThan				-> STRONG_ENOUGH_YOU_ARE_NOT, POWERFUL_YOU_HAVE_BECOME
Or					    -> WHAT_WE_KNOW_NOT
And					    -> STRONG_ENOUGH_YOU_ARE_NOT

DeclareMethod			-> IF_SO_POWERFUL_YOU_ARE_WHY_LEAVE
NonVoidMethod			-> BEGUN_THE_CLONE_WAR_HAS
MethodArguments			-> I_SENSE_MUCH_FEAR_IN_YOU
Return					-> PASS_ON_WHAT_YOU_HAVE_LEARNED
EndMethodDeclaration	-> NO_MORE_TRAINING_YOU_REQUIRE
CallMethod				-> SHOULD_I_CALL_YOU_DARTH_SIDIOUS

AssignVariableFromMethodCall 		-> POWERFUL_YOU_HAVE_BECOME
DeclareInt				-> YOU_MUST_CONFRONT_VADER
SetInitialValue			-> THE_DARK_SIDE_I_SENSE_IN_YOU
BeginMain				-> A_JOURNEY_I_MUST_MAKE
EndMain					-> GO_I_WILL
Print					-> MY_ALLY_IS_THE_FORCE
ReadInteger				-> OUT_THINK_THE_DROIDS_YOU_CAN
AssignVariable			-> TOO_MUCH_WEIGHT_SLOW_YOU_DOWN_IT_WILL
SetValue				-> WARS_NOT_MAKE_ONE_GREATE.
ParseError				-> DISOBEYING_THE_COUNCIL_YOUR_EXPERTISE_IS

## Example 

### TEST string

include dijn210
A_JOURNEY_I_MUST_MAKE
id POWERFUL_YOU_HAVE_BECOME 321 STRAIGHT_PATH_WE_WILL_NOT_FOLLOW
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
THE_GREATEST_TEACHER_FAILURE_IS
43 POWERFUL_YOU_HAVE_BECOME id HURRY_WE_MUST
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
ATTACHMENT_LEADS_TO_JEALOUSY
DO_OR_DO_NOT
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
PASS_ON_WHAT_YOU_HAVE_LEARNED id
GO_I_WILL
FLOAT a, INT b IF_SO_POWERFUL_YOU_ARE_WHY_LEAVE methodname
id POWERFUL_YOU_HAVE_BECOME 321 STRAIGHT_PATH_WE_WILL_NOT_FOLLOW
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
THE_GREATEST_TEACHER_FAILURE_IS
43 POWERFUL_YOU_HAVE_BECOME id HURRY_WE_MUST
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
ATTACHMENT_LEADS_TO_JEALOUSY
DO_OR_DO_NOT
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
PASS_ON_WHAT_YOU_HAVE_LEARNED id
NO_MORE_TRAINING_YOU_REQUIRE
FLOAT FLOAT a, INT b BEGUN_THE_CLONE_WAR_HAS methodname
id POWERFUL_YOU_HAVE_BECOME 321 STRAIGHT_PATH_WE_WILL_NOT_FOLLOW
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
THE_GREATEST_TEACHER_FAILURE_IS
43 POWERFUL_YOU_HAVE_BECOME id HURRY_WE_MUST
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
ATTACHMENT_LEADS_TO_JEALOUSY
DO_OR_DO_NOT
FLOAT id WARS_NOT_MAKE_ONE_GREATE 5 SIZE_MATTERS_NOT 7
PASS_ON_WHAT_YOU_HAVE_LEARNED id
NO_MORE_TRAINING_YOU_REQUIRE
exit

### Parsed TEST string 

include string
MAIN
ID GREATERTHAN 321 IF
    ID = 5 + 7
ELSE
    WHILE 43 GREATERTHAN ID
        ID = 5 + 7
    ENDWHILE
ENDIF
ID = 5 + 7
RETURN ID
ENDMAIN

VOIDMETHOD methodname(float a, int b)
ID GREATERTHAN 321 IF
    ID = 5 + 7
ELSE
    WHILE 43 GREATERTHAN ID
        ID = 5 + 7
    ENDWHILE
ENDIF
ID = 5 + 7
RETURN ID

FLOAT methodname(float a, int b)
ID GREATERTHAN 321 IF
    ID = 5 + 7
ELSE
    WHILE 43 GREATERTHAN ID
        ID = 5 + 7
    ENDWHILE
ENDIF
ID = 5 + 7
RETURN ID

