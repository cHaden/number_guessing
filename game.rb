maxValue = 100 #allows to easily reset the range of guesses
randomNumber = rand(maxValue) + 1
guessesLeft = 10
noCorrectGuess = true

def evaluate( guess, randomNumber )

  noCorrectGuess = true
  
  if( guess < randomNumber )
    puts "Your guess is a little low"
  elsif( guess > randomNumber)
    puts "Your guess is a little high"
  else
    puts "Correct! I was thinking " + randomNumber.to_s
    noCorrectGuess = false
  end

  return noCorrectGuess
end

puts "Guess a number between 1 and " + maxValue.to_s

while( (guessesLeft > 0) && noCorrectGuess )
  puts "You have " + guessesLeft.to_s + " guesses left"

  guess = gets.chomp.to_i

  puts "You guessed " + guess.to_s

  noCorrectGuess = evaluate(guess,randomNumber)

  guessesLeft -= 1
end

if noCorrectGuess
  puts "Sorry! I was thinking " + randomNumber.to_s
end
