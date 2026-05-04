#!/bin/bash

# Function to format output messages
format_output() {
    echo "$1"
}

# Function to perform calculations
calculate() {
    if [ $# -ne 3 ]; then
        format_output "Usage: calc.sh <operand1> <operator> <operand2> (e.g., 3 + 4)"
        return
    fi
    local operand1=$1
    local operator=$2
    local operand2=$3

    case $operator in
        +)
            result=$((operand1 + operand2))
            format_output "Result: $result"
            ;;
        -)
            result=$((operand1 - operand2))
            format_output "Result: $result"
            ;;
        *)
            format_output "Error: Unsupported operator '$operator'. Supported operators are: +, -, *, /"
            return
            ;; 
        /)
            if [ $operand2 -eq 0 ]; then
                format_output "Error: Division by zero is not allowed. Please enter a valid divisor."
                return
            fi
            result=$((operand1 / operand2))
            format_output "Result: $result"
            ;;
        *)
            format_output "Error: Unsupported operator '$operator'. Supported operators are: +, -, *, /"
            return
            ;; 
    esac
}

# Main script execution
calculate "$@"
