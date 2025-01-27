"""This script increment students exam score."""


import csv


def increase_score():
    """Increments the scores in a CSV file by a given value.

    Args: 
        arg_1: description
        arg_2: description
    """
     # Initialize an empty dictionary to store the data
    data_dict = {}

    with open('students_results.csv', newline='') as csvfile:
        reader = csv.reader(csvfile)
        
        # Skip the header row
        header = next(reader)  # This skips the first row (header)

        # Process each row
        for row in reader:
            name = row[0]  # The name (first column)
            try:
                score = int(row[1])  # The score (second column, converted to an integer)
            except ValueError:
                print(f"Invalid score value for {name}: {row[1]}")
                continue  # Skip this row if the score is invalid

            # Apply the score increment logic based on conditions
            if score < 40:
                new_score = score + 20  # If score < 40, add 20
            elif 40 <= score <= 60:
                new_score = score + 15  # If score is between 40 and 60, add 15
            elif score > 60:
                new_score = score + 10  # If score > 60, add 10

            # Store the updated data in the dictionary (name as key, new score as value)
            data_dict[name] = new_score

    # Print the dictionary containing updated scores
    print(data_dict)
    return data_dict

increase_score()