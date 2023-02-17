#!/bin/bash

# Set color variables
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Get user input
read -p "Enter first number: " num1
read -p "Enter second number: " num2

# Print menu of available operations
echo "Please select an operation:"
echo "1) Addition"
echo "2) Subtraction"
echo "3) Multiplication"
echo "4) Division"
read -p "Enter operation number: " op

# Perform the operation based on user input
case $op in
  1)
    result=$((num1 + num2))
    echo -e "${BLUE}Result: $result${NC}"
    ;;
  2)
    result=$((num1 - num2))
    echo -e "${GREEN}Result: $result${NC}"
    ;;
  3)
    result=$((num1 * num2))
    echo -e "${RED}Result: $result${NC}"
    ;;
  4)
    if [ $num2 -eq 0 ]; then
      echo "Cannot divide by zero!"
    else
      result=$((num1 / num2))
      echo -e "${PURPLE}Result: $result${NC}"
    fi
    ;;
  *)
    echo "Invalid operation selected."
    ;;
esac
