# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise

## Rails Code Explanation

1. Go to the application
	`cd $HOME/backend-live-coding-exercise-ruby-main`

2. Start the server
	`rails s`

## Ruby Code Explanation

1. Asking Questions (do_prompt method):
- The program iterates over the questions, printing each one and collecting the user's response.
- It ensures valid input by repeatedly asking the user until they provide a valid answer (either "Yes", "No", "Y", or "N").
- The responses are stored in a list as "yes" or "no".

2. Storing Answers (store_answers method):
- This method saves the collected answers to the PStore database.
- It initializes the :surveys key if it does not already exist and appends the new survey answers to it.

3. Calculating the Rating (calculate_rating method):
- This method calculates the rating as 100 * number of 'yes' answers / number of questions.
- It rounds the result to two decimal places for better readability.

4. Generating the Report (do_report method):
- This method reads the stored surveys from the PStore database.
- It calculates the rating for the current run and the average rating across all runs.
- It prints the current and average ratings.

## Bash Script

1. Make the Script Executable: `chmod +x ./bin/run_questionnaire.sh`
2. Run the script: `./bin/run_questionnaire.sh`

## Docker

1. Build the Docker Image: `docker build -t questionnaire .`
2. Run the Docker Container: `docker run --rm questionnaire`
	The --rm flag ensures that the container is removed after it stops. 

