import random


def main():

    print(play())

    play_again = input("\nPlay again? y/n\n").lower()

    if play_again == 'y':
        main()
    elif play_again == 'n':
        return


def play():
    user = input(
        "\nWhat's your choice? 'r' for rock, 'p' for paper, 's' for scissors\n").lower()
    computer = random.choice(['Rock', 'Paper', 'Scissors'])

    if user == 'r':
        user = 'Rock'
    elif user == 's':
        user = 'Scissors'
    elif user == 'p':
        user = 'Paper'
    else:
        return "Invalid input"

    if user == computer:
        return (f"{user} x {computer}\nIt's a tie")

    if is_win(user, computer):
        return (f"{user} x {computer}\nYou won!")

    return (f"{user} x {computer}\nYou lost!")


def is_win(player, opponent):
    if (player == 'Rock' and opponent == 'Scissors') or (player == 'Scissors' and opponent == 'Paper') \
            or (player == 'Paper' and opponent == 'Rock'):
        return True


main()
