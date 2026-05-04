# AGENT-14 — Technical Design

# Technical Design for Simple Calculator

## Architecture Overview
- **Type**: Command-line application
- **Language**: Bash shell script
- **Execution**: Executed directly in any Unix-like terminal that supports Bash

## Components
1. **Main Script**: The primary Bash script (`calculator.sh`) that handles input, operations, and output.
2. **Input Handling**: Capture and validate user input from the command line.
3. **Operation Logic**: Perform basic arithmetic operations (add, subtract, multiply, divide).
4. **Output Handling**: Display the results of the calculation to the user.

## Data Flow
1. **User Input**: User enters a command with two numbers and an operation sign.
2. **Validation**: Validate the input format and data type.
3. **Operation Selection**: Match the operation sign with the correct arithmetic function.
4. **Calculation**: Perform calculation and handle any calculation errors (e.g., division by zero).
5. **Result Output**: Output the result to the terminal.

## Key Decisions
- **Input Format**: Simplistic format where the user inputs something like `3 + 4`.
- **Error Handling**: Basic error handling to throw user-friendly messages for incorrect inputs or operations.
- **Platform Dependency**: Limited to systems that support Bash scripting (e.g., Linux, macOS).

## Example Script Structure

```bash
#!/bin/bash

function calculate() {
  local operand1=$1
  local operator=$2
  local operand2=$3

  case $operator in
    +)
      echo $(($operand1 + $operand2))
      ;;
    -)
      echo $(($operand1 - $operand2))
      ;;
    \*)
      echo $(($operand1 * $operand2))
      ;;
    /)
      if [ $operand2 -eq 0 ]; then
        echo "Error: Division by zero"
      else
        echo $(($operand1 / $operand2))
      fi
      ;;
    *)
      echo "Error: Unsupported operator"
      ;;
  esac
}

if [ $# -ne 3 ]; then
  echo "Usage: calc.sh <operand1> <operator> <operand2>"
  exit 1
fi

calculate $1 $2 $3
```
