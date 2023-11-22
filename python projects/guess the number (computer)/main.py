import random

def computer_guess():
    feedback = ''
    low = int(input("What is the lowest number possible? "))
    high = int(input("What is the highest number possible? "))
    while feedback != 'C':
        if low != high:
            guess = random.randint(low, high)
        else:
            guess = low  # could also be high because low = high
        feedback = input(
            f"Is {guess} too high (H), too low (L), or correct (C)? ").upper()
        if feedback == "H":
            high = guess - 1
        elif feedback == "L":
            low = guess + 1

    print(f"Yay! The computer guessed your number, {guess}, correctly!")


computer_guess()
