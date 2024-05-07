#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

const char* getTokenName(int token) {
    switch(token) {
        case IDENTIFIER:      return "IDENTIFIER";
        case INTEGER_VALUE:   return "INTEGER_VALUE";
        case FLOAT_VALUE:     return "FLOAT_VALUE";

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
        case DOT:             return "DOT";

        case ALPHABET:        return "ALPHABET";
        case STREAK:          return "STREAK";
        case CATEGORY:        return "CATEGORY";
        case STRING:          return "STRING";
        case MULTICOTOMIZED_STRING: return "MULTICOTOMIZED_STRING";
        case TWO_WAY_CLASSIFICATION_MODEL: return "TWO_WAY_CLASSIFICATION_MODEL";

        case SYMBOL:          return "SYMBOL";

        case GET_STREAKS:     return "GET_STREAKS";
        case ADD_SYMBOL:      return "ADD_SYMBOL";
        case COUNTER_FUNCTION: return "COUNTER_FUNCTION";
        case TOTAL_STREAKS:   return "TOTAL_STREAKS";
        case MULTICOTOMIZE:   return "MULTICOTOMIZE";
        case TOTAL_DATA_MODEL: return "TOTAL_DATA_MODEL";
        case TOTAL_DATA_BLOCK: return "TOTAL_DATA_BLOCK";
        case TOTAL_DATA_TREATMENT: return "TOTAL_DATA_TREATMENT";
        case GET_TOTAL_DATA:  return "GET_TOTAL_DATA";
        case GET_BLOCK_DATA:  return "GET_BLOCK_DATA";
        case GET_TREATMENT_DATA: return "GET_TREATMENT_DATA";

        case PRINT:           return "PRINT";

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
