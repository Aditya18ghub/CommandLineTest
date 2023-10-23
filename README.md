# UserLogin-SignupusingLinux


This project involves creating a Linux Shell Script with the following requirements:

## User Management

- Provide a user prompt for sign-up and sign-in.
  - Sign In
  - Take Test
  - View Test
  - Sign up
  - Exit

## Sign Up

- Users can register with a user-ID and password.
  - Ask for a user-name. The user-name should contain only alphanumeric symbols.
  - Ask for a new password. The password can contain any symbol and must be at least 8 characters with at least one number and symbol.
  - Ask the user to re-enter the password for validation.

## Sign In

- Registered users can sign in with their ID and password.
  - The password should be handled securely.

## Logging

- Create a log file, `test_activity.log`, to record all user activities.
  - Include date and time for every activity.

## Question Bank

- Users should provide a question bank file.
- If not provided, the script will search for a default question bank named `question_bank.txt`.

## Taking a Test

- Create a directory called `.TestData` in the user's directory structure if it doesn't exist.
- Create a file named `answer_file.csv` under `.TestData`.
- Prompt the user with questions randomly picked from the question bank.
- Questions should have multiple-choice answers.
- Questions are timed (e.g., 10 seconds).
- On timeout, the question should be refreshed.
- Store every answer in `answer_file.csv` with the question separated by a comma.
- Include the attempt time.

## Viewing Test Results

- If the user chooses to view the test results, the script should show all the questions with options and highlight the user's answers.
- All user-entered answers are stored in `answer_file.csv`.

## Time-out

- The script should time out if the user is inactive for more than 10 seconds on the main menu.

Feel free to adapt this structure to your README.md file. You can use this as a starting point and add any additional details or explanations as needed for your project.

