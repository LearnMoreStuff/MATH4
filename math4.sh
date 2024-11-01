#!/bin/bash

ask_question() {
  local level=$1
  local a b correct_answer user_answer

  for i in {1..5}; do
    case $level in
      1)
        a=$((RANDOM % 10 + 1))
        b=$((RANDOM % 10 + 1))
        correct_answer=$((a + b))
        read -r -p "Question $i: What is $a + $b? " user_answer
        ;;
      2)
        a=$((RANDOM % 50 + 1))
        b=$((RANDOM % 50 + 1))
        correct_answer=$((a - b))
        read -r -p "Question $i: What is $a - $b? " user_answer
        ;;
      3)
        a=$((RANDOM % 12 + 1))
        b=$((RANDOM % 12 + 1))
        correct_answer=$((a * b))
        read -r -p "Question $i: What is $a * $b? " user_answer
        ;;
      4)
        a=$((RANDOM % 100 + 1))
        b=$((RANDOM % 100 + 1))
        correct_answer=$(echo "scale=2; $a / $b" | bc)
        read -r -p "Question $i: What is $a / $b (rounded to 2 decimal places)? " user_answer
        ;;
      *)
        echo "Invalid level."
        return 1
        ;;
    esac

    if [[ "$user_answer" == "$correct_answer" ]]; then
      echo "Correct! Well done!"
    else
      echo "Incorrect. The correct answer is $correct_answer."
    fi
  done

  return 0
}

main() {
  echo "Welcome to the math quiz!"
  echo "Please pick a level:"
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"

  read -r -p "Enter the level number you want to attempt: " level

  case $level in
    1|2|3|4)
      echo -e "\nYou have chosen Level $level. You will be asked 5 questions."
      ask_question "$level"
      ;;
    *)
      echo "Invalid level selected. Exiting."
      ;;
  esac
}

main
