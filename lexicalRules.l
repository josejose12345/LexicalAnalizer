%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Define token types */
#define IDENTIFIER      1
#define INTEGER         2
#define FLOAT           3
#define STRING          4
#define KEYWORD         5
#define OPERATOR        6
#define PUNCTUATION     7
#define BUILTIN_FUNC    8   /* New token type for built-in functions */
%}

/* Regular Definitions */
digit       [0-9]
letter      [a-zA-Z]
identifier  {letter}({letter}|{digit})*
integer     {digit}+
floatnum    {digit}+\.{digit}+
string      \"([^"\\]|\\.)*\"

%%

{integer}   { yylval.strVal = strdup(yytext); return INTEGER; }
{floatnum}  { yylval.strVal = strdup(yytext); return FLOAT; }
{string}    { yylval.strVal = strdup(yytext); return STRING; }

sum         { return BUILTIN_FUNC; }
avg         { return BUILTIN_FUNC; }
max         { return BUILTIN_FUNC; }
min         { return BUILTIN_FUNC; }

{identifier}    {
                    /* Check if the identifier is a keyword */
                    if (strcmp(yytext, "if") == 0 || strcmp(yytext, "else") == 0 ||
                        strcmp(yytext, "while") == 0 || strcmp(yytext, "for") == 0 ||
                        strcmp(yytext, "def") == 0 || strcmp(yytext, "class") == 0) {
                            return KEYWORD;
                    } else {
                            yylval.strVal = strdup(yytext);
                            return IDENTIFIER;
                    }
                }

[+]         { return OPERATOR; }
[-]         { return OPERATOR; }
[*]         { return OPERATOR; }
[/]         { return OPERATOR; }
[=]         { return OPERATOR; }

[;]         { return PUNCTUATION; }
[,]         { return PUNCTUATION; }
[:]         { return PUNCTUATION; }
[(]         { return PUNCTUATION; }
[)]         { return PUNCTUATION; }
[{]         { return PUNCTUATION; }
[}]         { return PUNCTUATION; }

[ \t\n]     ; /* Ignore whitespace and newline characters */
.           { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }

%%

int main(void) {
    yylex();
    return 0;
}
