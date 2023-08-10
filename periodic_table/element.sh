PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

#if no arguments
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  #check if argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  else #check if the characters entered are in the database
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
  fi
  #if element not found
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else #output the element info
    ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
    echo $ELEMENT_RESULT | while read ATOM_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELTING BAR BOILING BAR TYPE
    do
      echo -e "The element with atomic number $ATOM_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi