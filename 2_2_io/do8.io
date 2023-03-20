# Math floor. Return greatest integer which is smaller than the number.
floor := method(number, number - (number % 1))

# Generate a random integer in the interval [1, upperLimit].
generateRandomInteger := method(upperLimit,
    randomNumberFloat := ((Date now asNumber + upperLimit) * 1000 % upperLimit) + 1
    floor(randomNumberFloat)
)

allowedAttempts := 4
target := generateRandomInteger(10)
hotRange := 3
lost := true

for(currentAttempt, 1, allowedAttempts,
    guess := doString(File standardInput readLine)
    if (guess == target,
        "You got it! It took you #{currentAttempt} attempts" interpolate println
        lost := false
        break
    )
    if (guess - target <= hotRange,
        "Hot, within #{hotRange} numbers from the target" interpolate println,
        "Cold, more than #{hotRange} numbers away from the target" interpolate println
    )
    "Attempts remaining: #{allowedAttempts - currentAttempt}" interpolate println
)

if(lost, "Attempts over, the target is #{target}" interpolate println)
