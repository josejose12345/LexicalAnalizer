#!/bin/bash

# Run lex on the lexical rules file
lex lexicalRules.l

# Compile the scanner using gcc
gcc myscanner.c lex.yy.c -o myscanner

# Run the scanner with input from config.in
./myscanner < config.in
