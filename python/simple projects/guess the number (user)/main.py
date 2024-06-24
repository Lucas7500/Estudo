import random

x = int(input("The lowest number possible is gonna be: "))
y = int(input("The highest number possible is gonna be: "))


def guess(x, y):
    random_number = random.randint(x, y)
    guess = 0
    while guess != random_number:
        guess = int(input(f"Guess a number beetween {x} and {y}: "))
        if guess < random_number:
            print("Sorry, guess again. Too low.")
        elif guess > random_number:
            print("Sorry, guess again. Too high.")

    print(
        f"Congratulations! You have guessed the number {random_number} correctly!")


guess(x, y)
