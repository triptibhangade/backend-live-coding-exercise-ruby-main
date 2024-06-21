#!/bin/bash

# Name of the Ruby file to run
RUBY_FILE="questionnaire.rb"

# Function to check for Ruby installation
check_ruby_installed() {
  if ! command -v ruby &> /dev/null
  then
    echo "Ruby is not installed. Please install Ruby to run this exercise."
    exit 1
  fi
}

# Function to run the Ruby file
run_ruby_file() {
  if [ -f "$RUBY_FILE" ]; then
    echo "Running $RUBY_FILE..."
    ruby "$RUBY_FILE"
  else
    echo "$RUBY_FILE not found. Please make sure the file exists in the current directory."
    exit 1
  fi
}

# Main script execution
echo "Checking for Ruby installation..."
check_ruby_installed

echo "Running Ruby file if it exists..."
run_ruby_file

echo "Done."