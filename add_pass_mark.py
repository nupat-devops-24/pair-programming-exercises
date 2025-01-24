"""This script increment students exam score."""


def increase_score():
    """Increments the scores in a CSV file by a given value.

    Args: 
        arg_1: description
        arg_2: description
    """
    data = open('students_results.csv')
    for line in data:
        print(line)

increase_score()