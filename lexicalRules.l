%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myscanner.h"
%}

%option nounput yylineno

%%

print      { return PRINT; }

Alphabet { return ALPHABET; }
Streak {return STREAK;}
Category {return CATEGORY;}
String      { return STRING; }
MulticotomizedString {return MULTICOTOMIZED_STRING;}
TwoWayClassificationModel {return TWO_WAY_CLASSIFICATION_MODEL;}

int         { return INT; }
float       { return FLOAT; }
symbol      { return SYMBOL; }


getStreaks { return GET_STREAKS; }
addSymbol  { return ADD_SYMBOL; }
counterFunction { return COUNTER_FUNCTION; }
totalStreaks { return TOTAL_STREAKS; }
multicotomize { return MULTICOTOMIZE; }
totalDataModel {return TOTAL_DATA_MODEL;}
totalDataBlock {return TOTAL_DATA_BLOCK;}
totalDataTreatment {return TOTAL_DATA_TREATMENT;}
getTotalData {return GET_TOTAL_DATA;}
getBlockData {return GET_BLOCK_DATA;}
getTreatmentData {return GET_TREATMENT_DATA;}

if          { return IF; }
else        { return ELSE; }
for         { return FOR; }
while       { return WHILE; }
return      { return RETURN; }

"+"         { return OPERATOR; }
"-"         { return OPERATOR; }
"*"         { return OPERATOR; }
"/"         { return OPERATOR; }
"="         { return OPERATOR; }
"<"         { return OPERATOR; }
">"         { return OPERATOR; }
"!"         { return OPERATOR; }
"&&"        { return LOGICAL_AND; }
"||"        { return LOGICAL_OR; }
"=="        { return EQUAL; }
"!="        { return NOT_EQUAL; }


"("         { return LEFT_PAREN; }
")"         { return RIGHT_PAREN; }
";"         { return SEMICOLON; }
","         { return COMMA; }
":"         { return COLON; }
"{"         { return LEFT_BRACE; }
"}"         { return RIGHT_BRACE; }
"."         { return DOT; }


[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
[0-9]+                  { return INTEGER_VALUE; }  
[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)? { return FLOAT_VALUE; }

"/*"(.|\n)*"*/"           { /* Ignore comments */ }
"//".*                    { /* Ignore single line comments */ }
[ \t\n]+                  { /* Ignore whitespace */ }
.                         { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }

%%
int yywrap(void) { return 1; }
