=begin
Problem statement:
If you’re feeling the need for a little more, write a program that picks a random number. Let a
player guess the number, telling the player whether the guess is too low or too high.

Solution:
1. Randomly generate an integer in the interval [1, 10].
2. Prompt the user for a number in the interval.
3. If the user-provided number is greater than the random number, print "Too high."
4. If the user-provided number is less than the random number, print "Too low."
5. If the user-provided number is equal to the random number, print "You got it right!"
6. Repeat 2-4 until 5 is reached, at which point the program exits.
7. Bonus: Just before the program exits, display the attempt count.
=end

target_lower_limit = 1
target_upper_limit = 10
target = rand(Range.new(1, 10))

puts "A random number has been generated from #{target_lower_limit} to #{target_upper_limit}."
puts "Try to find the number. You have an indefinite amount of attempts."

def print_attempt_prompt(attempt, target)
  if attempt > target
    puts 'Too high.'
  elsif attempt < target
    puts 'Too low.'
  elsif attempt == target
    puts 'You got it right!'
  end
end

current_attempt = nil
current_amount_of_attempts = 0

until current_attempt == target
  current_attempt = (gets).to_i
  print_attempt_prompt(current_attempt, target)
  current_amount_of_attempts += 1
end

puts "You found the right number in #{current_amount_of_attempts} attempts."
