#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Handle Argument from User
if [[ $1 ]];
then
  INPUT=$1
  if [[ $INPUT =~ ^[0-9]+$ ]];
  then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = $INPUT;")
    if [[ -z $ELEMENT_DATA ]]
    then
      echo "I could not find that element in the database."
    else
    #Run Query based on atomic number provided 
      echo $ELEMENT_DATA | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
       echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    fi
  else
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE name = '$INPUT' OR symbol = '$INPUT';")
    if [[ -z $ELEMENT_DATA ]]
    then
      echo "I could not find that element in the database."
    else
    #Run Query based on atomic number provided 
      echo $ELEMENT_DATA | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
       echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    fi
  fi
else
  echo "Please provide an element as an argument."
fi