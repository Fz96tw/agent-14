#!/bin/bash

calculate() {
  local operand1="" operand2="" operator=""
  operand1="$1"
  operator="$2"
  operand2="$3"

  case "$operator" in
    +)
      echo $(($operand1 + $operand2))
      ;; 
    -)
      echo $(($operand1 - $operand2))
      ;; 
    *)\n      echo "Error: Unsupported operator"
      ;; 
    \*)
      echo $(($operand1 * $operand2))
      ;; 
    /)
      if [ "$operand2" -eq 0 ]; then
        echo "Error: Division by zero"
      else
        echo $(($operand1 / $operand2))
      fi
      ;; 
  esac
}

if [ "$#" -ne 3 ]; then
  echo "Usage: calc.sh <operand1> <operator> <operand2>"
  exit 1
fi

calculate "$1" "$2" "$3"