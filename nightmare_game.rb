# Write the opposite program as well: you, the user,
# pick a number between 1 and 100. The computer has to guess the number.
# You tell it whether it's too high, too low, or correct after each guess.
# The computer gets five guesses. The computer should tell you if you are
# lying to it. (e.g. Computer guesses 50, you say "High." Computer then
# guesses 49 and you say "Low." You'd be lying, as there are no numbers
# between them.)

puts "Pick a number between 1 and 100"
your_number = gets.chomp.to_i
stillGuessing = true
remainingGuesses = 5


maximumGuess = 101 #there might be a better work-around to get the computer to guess 100 when needed?
minimumGuess = 1

while stillGuessing && remainingGuesses > 0

  ##debug
  ##puts "I think max = #{maximumGuess} and min = #{minimumGuess}"

  computerGuess = (maximumGuess - minimumGuess) / 2 + (minimumGuess)
  puts "Is it #{computerGuess}?"

  puts "(High, Low, or Correct?)"
  response = gets.chomp

  if response.upcase == "CORRECT"
    stillGuessing = false
    puts "VICTORY!!"
  elsif response.upcase == "HIGH"
    maximumGuess = computerGuess
  elsif response.upcase == "LOW"
    minimumGuess = computerGuess
  end

  if minimumGuess >= 100 || maximumGuess <= 1
    puts "The number needs to be in the range of 1 to 100. Did you forget?"
    stillGuessing = false
  elsif maximumGuess - minimumGuess <= 1 && maximumGuess > 2
    puts "Have you been fibbing??"
    stillGuessing = false
  end

  remainingGuesses -= 1
end

if stillGuessing
  puts "I give up!"
end
