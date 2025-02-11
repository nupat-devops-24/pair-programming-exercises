"""This script increments students exam score."""


import csv


def increase_score():
    """Increments the scores in a CSV file by a given value."""
    # Initialize an empty dictionary to store the data
    data_dict = {}

    with open('students_results.csv', newline='') as csvfile:
        reader = csv.reader(csvfile)

        # Skip the first row
        next(reader)

        # Process each row
        for row in reader:
            name = row[0]  # The name (first column)
            try:
                # The score (second column, converted to an integer)
                score = int(row[1])
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

            # Store the updated data in the dictionary
            # (name as key, new score as value)
            data_dict[name] = new_score

    # Return the dictionary containing updated scores
    return data_dict


def increase_score_v2():
    """Increments the scores in a CSV file by a given value."""
    try:
        with open('students_results.csv', 'r') as data, \
                open('new_students_results.csv', 'w') as output_file:
            # Read the first line in the data file
            header = data.readline()
            # Write out the first line into a new data file
            output_file.write(header)

            for line in data:
                name, score = line.strip().split(',')

                # Convert score data type from string to int
                score = int(score)

                # Apply the score increment logic based on conditions
                if score < 40:
                    score += 20  # If score < 40, add 20
                elif 40 <= score <= 60:
                    score += 15  # If score is between 40 and 60, add 15
                elif score > 60:
                    score += 10  # If score > 60, add 10

                # Write the upgraded scores into the output data file
                output_file.write(f"{name}, {score}\n")

    except FileNotFoundError:
        print("Data file not found.")

    return output_file
