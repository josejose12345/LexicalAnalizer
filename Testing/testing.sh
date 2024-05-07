#!/bin/bash

# Compile lexical analyzer
lex lexicalRules.l
gcc myscanner.c lex.yy.c -o myscanner

# Run the lexical analyzer on each .in file in the Tests directory
for file in Testing/*.in
do
    echo "Testing file: $file"
    echo "------------------- Original Text -------------------"
    cat $file
    echo
    echo "------------------- Tokens -------------------"
    ./myscanner < "$file"
    echo "<----------------------------------------------------->"
    echo
    echo
done