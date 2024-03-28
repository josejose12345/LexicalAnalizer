%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myscanner.h"
%}

%option nounput yylineno

%%

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
