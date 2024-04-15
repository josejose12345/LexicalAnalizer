#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

const char* getTokenName(int token) {
    switch(token) {
	case TWO_WAY_CLASSIFICATION_MODEL: return "TWO_WAY_CLASSIFICATION_MODEL";
	case ALPHABET:                     return "ALPHABET";
        case SYMBOL:                       return "SYMBOL";
        case STRING:                       return "STRING";
        case STREAK:                       return "STREAK";
        case CATEGORY:                     return "CATEGORY";
	case MULTICOTOMIZE:                return "MULTICOTOMIZE";
        case COUNT_CHANGE:                 return "COUNT_CHANGE";
        case STREAK_NUMBER:                return "STREAK_NUMBER";
        case TOTAL_DATA_MODEL:             return "TOTAL_DATA_MODEL";
        case TOTAL_DATA_BLOCK:             return "TOTAL_DATA_BLOCK";
        case TOTAL_DATA_TREATMENT:         return "TOTAL_DATA_TREATMENT";
        case GET_TOTAL_DATA:               return "GET_TOTAL_DATA";
        case GET_BLOCK_DATA:               return "GET_BLOCK_DATA";
        case GET_TREATMENT_DATA:           return "GET_TREATMENT_DATA";
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
