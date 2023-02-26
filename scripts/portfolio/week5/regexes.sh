#!/bin/bash

# Search for all sed statements
grep -r "sed " ./

# Search for all lines that start with the letter m
grep -r "^m" ./

# Search for all lines that contain three digit numbers
grep -r "[0-9]\{3\}" ./

# Search for all echo statements with at least three words
grep -r "echo .*\b\w+\b.*\b\w+\b.*\b\w+\b" ./

# Search for all lines that would make a good password (at least 12 characters, including uppercase and lowercase letters, numbers, and special characters)
grep -r "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{12,}$" ./
