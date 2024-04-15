%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myscanner.h"
%}

%option nounput yylineno

%%
alphabet {return ALPHABET;}
symbol {return SYMBOL;}
string {return STRING;}
streak {return STREAK;}
category {return CATEGORY;}
two_way_classification_model { return TWO_WAY_CLASSIFICATION_MODEL; }

multicotomize {return MULTICOTOMIZE;}
countChange {return COUNT_CHANGE;}
streakNumber {return STREAK_NUMBER;}
totalDataModel {return TOTAL_DATA_MODEL;}
totalDataBlock {return TOTAL_DATA_BLOCK;}
totalDataTreatement {return TOTAL_DATA_TREATEMENT;}
getTotalData {return GET_TOTAL_DATA;}
getBlockData {return GET_BLOCK_DATA;}
getTreatementData {return GET_TREATEMENT_DATA;}

int         { return INT; }
float       { return FLOAT; }
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
[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
[0-9]+                    { return INTEGER_LITERAL; }
[0-9]+"."[0-9]*           { return FLOAT_LITERAL; }
"/*"(.|\n)*"*/"           { /* Ignore comments */ }
"//".*                    { /* Ignore single line comments */ }
[ \t\n]+                  { /* Ignore whitespace */ }
.                         { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }

%%
int yywrap(void) { return 1; }
