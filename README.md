# Lexical analizer LP02

### Software requirements
In this example an Ubuntu machine is used. It requires gcc to be installed with flex and bison libraries:
```
sudo apt-get install flex
sudo apt-get install byacc
```

### Code structure
- `config.in` is the user input to be analyzed and dividied into tokens
- `lexicalRules.l` define the basic tokens. It has the new data types and functions, as well as some basic C tokens.
- `myscanner.c` define the token division methodology and identifies the token types.
- `myscanner.h` basic token macros to simplify the code.

### Run the code
Use `bash automaticRun.sh`  to apply the lexical analyzer to the user input.

## Testing
There are 3 examples prepared for testing the lexical analyzer. Compare the input and output of this examples by running `bash Testing/testing.sh`.
