# YODAC

## Commands

- exit -> Accept
- \n -> Ignored
- SIZE_MATTERS_NOT -> +
- RUSH_NOT_INTO_FIGHTS -> -
- DIFFICULT_TO_SEE -> *
- YOU_ARE_RECKLESS -> /
- WARS_NOT_MAKE_ONE_GREATE -> =
- STRAIGHT_PATH_WE_WILL_NOT_FOLLOW -> IF
- DO_OR_DO_NOT -> ENDIF
- THE_GREATEST_TEACHER_FAILURE_IS -> ELSE
- HURRY_WE_MUST -> WHILE
- ATTACHMENT_LEADS_TO_JEALOUSY -> ENDWHILE
- PASS_ON_WHAT_YOU_HAVE_LEARNED -> RETURN
- MY_ALLY_IS_THE_FORCE -> PRINTF
- PERHAPS_NOTHING_IT_IS -> EQUALTO
- POWERFUL_YOU_HAVE_BECOME -> GREATERTHAN
- WHAT_WE_KNOW_NOT -> OR
- STRONG_ENOUGH_YOU_ARE_NOT -> AND
- SUPRISED -> BOOL (true)
- NOT_YET -> BOOL (false)
- A_JOURNEY_I_MUST_MAKE -> MAIN
- GO_I_WILL -> ENDMAIN
- IF_SO_POWERFUL_YOU_ARE_WHY_LEAVE -> METHOD
- BEGUN_THE_CLONE_WAR_HAS -> NONVOIDMETHOD
- I_SENSE_MUCH_FEAR_IN_YOU -> ARGS
- NO_MORE_TRAINING_YOU_REQUIRE -> ENDMETHOD
- ("INT"|"STRING"|"FLOAT") -> TYPES
- include -> INCLUDE
- ParseError -> DISOBEYING_THE_COUNCIL_YOUR_EXPERTISE_IS

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

