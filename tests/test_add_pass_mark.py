"""This file contains test cases for the score upgrade program/feature."""


import unittest
import csv
import add_pass_mark as apm


class TestIncreaseScores(unittest.TestCase):
    """TODO: class description."""

    def create_csv(self, filename: str, data: list[list]):
        """Create a csv file from a list of lists"""
        with open(filename, 'w', encoding="utf-8") as dummy_input_file:
            writer = csv.writer(dummy_input_file)
            writer.writerows(data)

    def test_increase_score_valid_input(self):
        """TODO: function description"""
        print('Debug: inserting data')
        # Data insertion
        good_data = [
            ['Name', 'Score'],
            ['Titi', '32'],
            ['Bose', '65'],
            ['Mary', '78'],
            ['Segun', '43']
        ]
        self.create_csv(filename='good_dummy_data.csv', data=good_data)

        # Method or operation
        print('Debug: calling the increase_score function')
        result = apm.increase_score('good_dummy_data.csv')

        # Assertion
        print('Debug: asserting that the output is equal to the expected values')
        expected = {'Titi': 52, 'Bose': 75, 'Mary': 88, 'Segun': 58}
        self.assertEqual(result, expected)

    def test_increase_score_invalid_input(self):
        """TODO: function description"""
        print('Debug: inserting data')
        # Data insertion
        bad_data = [
            ['Name', 'Score'],
            ['Titi', 'thirty-two'],
            ['Bose', '65'],
            ['Mary', '78'],
            ['Segun', '43']
        ]
        self.create_csv(filename='bad_dummy_data.csv', data=bad_data)

        # Method or operation
        print('Debug: calling the increase_score function')
        result = apm.increase_score('bad_dummy_data.csv')

        # Assertion
        print('Debug: asserting that the output is equal to the expected values')
        expected = {'Bose': 75, 'Mary': 88, 'Segun': 58}
        self.assertEqual(result, expected)


if __name__ == '__main__':
    unittest.main()
