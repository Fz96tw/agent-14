#!/bin/bash

# Validate number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: calc.sh <operand1> <operator> <operand2>"
    exit 1
fi

# Assign command line arguments to variables
operand1="$1"
operator="$2"
operand2="$3"

# Validate operand types
if ! [[ "$operand1" =~ ^-?[0-9]+$ ]] || ! [[ "$operand2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Operands must be integers"
    exit 1
fi

# Validate operator
if ! [[ "$operator" =~ ^[+\-*/]$ ]]; then
    echo "Error: Unsupported operator"
    exit 1
fi

# Output validated inputs (for debugging)
echo "Operands: $operand1, $operand2; Operator: $operator"

# Call the calculation function (assumed to be defined later)
# calculate $operand1 $operator $operand2