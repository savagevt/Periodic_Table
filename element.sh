#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Handle Argument from User
if [[ $1 ]];
then
  INPUT=$1
  if [[ $INPUT =~ 
else
  echo -e "\nPlease provide an element as an argument."
fi

# Check for valid Input

# If no input, display message

# if invalid input, display message

# Lookup input in database

# Return Values
