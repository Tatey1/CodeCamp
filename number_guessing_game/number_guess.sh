#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#ask username
echo Enter your username:
read USER_NAME
#check if username exists in database
USERNAME_RESULT=$($PSQL "SELECT username FROM games WHERE username='$USER_NAME'")
if [[ -z $USERNAME_RESULT ]] #if not found
then
  echo Welcome, $USER_NAME! It looks like this is your first time here.
  ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME')")
else #username found
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$USER_NAME'")
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE username='$USER_NAME'")
  echo Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi
#start game
SECRET_NUMBER=$(( RANDOM % 1000 + 1))
GUESSES=0
#get the user guess
echo Guess the secret number between 1 and 1000:
NUMBER_GUESS=0
while (( $NUMBER_GUESS != $SECRET_NUMBER ))
do
  read NUMBER_GUESS
  #check if input is an integer
  while [[ ! $NUMBER_GUESS =~ ^[0-9]+$ ]]
  do
    echo That is not an integer, guess again:
    read NUMBER_GUESS
  done
  GUESSES=$(($GUESSES + 1))

  #check if its greater or lower than the secret number
  if [[ $NUMBER_GUESS < $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $NUMBER_GUESS > $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    #number guessed
    echo You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!
    ADD_GAME=$($PSQL "INSERT INTO games(username, tries) VALUES('$USER_NAME', $GUESSES)")
  fi
done