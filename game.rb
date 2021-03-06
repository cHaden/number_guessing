
# initial set up ------------------------
maxValue = 100 #allows to easily reset the range of guesses
guessesLeft = 5
stillGuessing = true
guesses = [] #keep a history of guesses

# methods ------------------------------

# generate a random value between 1 and maxValue using rand
def generateTargetNumber(maxValue)
  rand(maxValue) + 1
end

#generate a random value between 1 and maxValue using sample
def alternateGenerateTargetNumber(maxValue)
  [*1..maxValue].sample #woooooo buddy that is slick-- remember this notation, self
end

def evaluate( guesses, randomNumber, maxValue )

  noCorrectGuess = true
  responseString = ""

  if( guesses[-1] < 1 || guesses[-1] > maxValue)
    responseString += "Your guess should be between 1 and #{maxValue}"
  elsif( guesses[-1] < randomNumber )
    responseString += "Your guess is a little low"
  elsif( guesses[-1] > randomNumber)
    responseString += "Your guess is a little high"
  else
    responseString += "Correct! I was thinking " + randomNumber.to_s
    noCorrectGuess = false
  end

  guesses.slice(0,guesses.length-1).each do |i|
    if i < randomNumber && i > guesses[-1] && responseString == "Your guess is a little low"
      responseString += ", and you've already guessed a higher number that was too low. Pull it together!"
    elsif i > randomNumber && i < guesses[-1] && responseString == "Your guess is a little high"
      responseString += ", and you've already guessed a lower number that was too high. Pull it together!"
    elsif i == guesses[-1] && !responseString.include?("You already guessed that")
      responseString += " (P.S. You already guessed that!)"
    end
  end

  puts responseString

  return noCorrectGuess
end

# main code ------------------------------
randomNumber = alternateGenerateTargetNumber(maxValue)

puts "Guess a number between 1 and " + maxValue.to_s

while( (guessesLeft > 0) && stillGuessing )
  puts "You have " + guessesLeft.to_s + " guesses left"

  guess = gets.chomp.to_i
  guesses << guess

  puts "You guessed " + guess.to_s

  stillGuessing = evaluate(guesses,randomNumber,maxValue)

  guessesLeft -= 1
end

if stillGuessing
  puts "Sorry! I was thinking " + randomNumber.to_s
end
