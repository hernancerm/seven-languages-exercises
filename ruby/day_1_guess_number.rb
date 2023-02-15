=begin
Problem statement:
If you’re feeling the need for a little more, write a program that picks a random number. Let a
player guess the number, telling the player whether the guess is too low or too high.

Solution:
1. Randomly generate an integer in [0, 9].
2. Prompt the user for a number in the interval.
3. If the user-provided number is greater than the random number, print "Too high."
4. If the user-provided number is less than the random number, print "Too low."
5. If the user-provided number is equal to the random number, print "You got it right."
6. Repeat 2-4 until 5 is reached, at which point the program exits.
7. Bonus: Just before the program exits, display the attempt count.
=end
