"""This module does xyz"""


def greet_and_calculate_once_no_loop():
    """
    Greets the user, asks for two numbers once, and calculates their product
    without using any while loops for input.
    """
    name = input("Hey there! What's your name? ")
    print(f"\nWelcome, {name}! Let's try a quick calculation.")

    num1_str = input("Enter the first number: ")
    try:
        num1 = float(num1_str)
    except ValueError:
        print("Hmm, that didn't look like a valid number for the first input. Sorry!")
        return  # Exit the function if the first input is invalid

    num2_str = input("Enter the second number: ")
    try:
        num2 = float(num2_str)
    except ValueError:
        print("Oops! The second input wasn't a valid number. Sorry about that!")
        return  # Exit the function if the second input is invalid

    product = num1 * num2
    print(f"\nAlright, {name}, the product of {num1} and {num2} is: {product}")
    print("Hope that worked out!")
