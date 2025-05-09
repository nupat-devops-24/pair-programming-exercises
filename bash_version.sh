#!/bin/bash


greet_and_calculate_once_no_loop() {
    # Greets the user, asks for two numbers once, and calculates their product
    read -p "Hey there! What's your name? " name
    echo -e "\nWelcome, $name! Let's try a quick calculation."

    read -p "Enter the first number: "  num1_str
    read -p "Enter the second number: " num2_str
    
    product=$(echo "$num1_str * $num2_str" | bc)
    echo -e "\nAlright, $name, the product of num1_str and num2_str is: $product"
    echo "Hope that worked out!"
} 

    
greet_and_calculate_once_no_loop
