#!/bin/bash

function validate_input() {
  if [ $# -ne 3 ]; then
    echo "Error: Usage: calculator.sh <operand1> <operator> <operand2>"
    return 1
  fi

  local operand1=$1
  local operator=$2
  local operand2=$3

  if ! [[ $operand1 =~ ^-?[0-9]+$ ]] || ! [[ $operand2 =~ ^-?[0-9]+$ ]]; then
    echo "Error: Operands must be valid numbers"
    return 1
  fi

  if ! [[ "$operator" =~ ^[\+\-\*/]$ ]]; then
    echo "Error: Operator must be +, -, *, or /"
    return 1
  fi

  return 0
}

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

validate_input "$@"
if [ $? -ne 0 ]; then
  exit 1
fi

calculate $1 $2 $3
