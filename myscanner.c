#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

const char* getTokenName(int token) {
    switch(token) {
        case IDENTIFIER:      return "IDENTIFIER";
        case INTEGER_LITERAL: return "INTEGER_LITERAL";
        case FLOAT_LITERAL:   return "FLOAT_LITERAL";
        case INT:             return "INT";
        case FLOAT:           return "FLOAT";
        case IF:              return "IF";
        case ELSE:            return "ELSE";
        case FOR:             return "FOR";
        case WHILE:           return "WHILE";
        case RETURN:          return "RETURN";
        case OPERATOR:        return "OPERATOR";
        case LOGICAL_AND:     return "LOGICAL_AND";
        case LOGICAL_OR:      return "LOGICAL_OR";
        case EQUAL:           return "EQUAL";
        case NOT_EQUAL:       return "NOT_EQUAL";
        case LEFT_PAREN:      return "LEFT_PAREN";
        case RIGHT_PAREN:     return "RIGHT_PAREN";
        case SEMICOLON:       return "SEMICOLON";
        case COMMA:           return "COMMA";
        case COLON:           return "COLON";
        case LEFT_BRACE:      return "LEFT_BRACE";
        case RIGHT_BRACE:     return "RIGHT_BRACE";
        default:              return "UNKNOWN";
    }
}

int main(void) 
{
    int ntoken;

    ntoken = yylex();
    while(ntoken) {
        printf("%s (%d): %s\n", getTokenName(ntoken), ntoken, yytext);
        ntoken = yylex();
    }
    return 0;
}
