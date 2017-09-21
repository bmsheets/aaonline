# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
    puts "Welcome to the guessing game. Please guess a number between 1 and 100."
    guess = gets.chomp.to_i
    num_guesses = 1
    number = rand(1..100) 
    while guess != number
        if guess > number
            puts "Your guess of #{guess} was too high. Try again!"
        else
            puts "Your guess of #{guess} was too low. Try again!"
        end 
        guess = gets.chomp.to_i
        num_guesses += 1
    end
    puts "Congratulations, you found the secret number #{number} in #{num_guesses} tries!"
end
