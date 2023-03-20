Math := Object clone do(
    # Return greatest integer which is smaller than the number.
    floor := method(number, number - (number % 1))

    # Use positive sign if negative sign.
    absolute := method(number,
        if(number >= 0, number, number * -1)
    )

    # Generate a random integer in the interval [1, upperLimit].
    generateRandomInteger := method(upperLimit,
        randomNumberFloat := ((Date now asNumber + upperLimit) * 1000 % upperLimit) + 1
        floor(randomNumberFloat)
    )
)
Math clone := Math

Game := Object clone do(
    make := method(allowedAttempts, targetUpperLimit, hotRange,
        game := Game clone
        game allowedAttempts ::= allowedAttempts
        game targetUpperLimit ::= targetUpperLimit
        game hotRange ::= hotRange
        game
    )

    start := method(
        target := Math generateRandomInteger(targetUpperLimit)
        "Hi! Guess a number between 1 and #{targetUpperLimit}" interpolate println
        for(currentAttempt, 1, allowedAttempts,
            guess := doString(File standardInput readLine)
            if (guess == target,
                "You got it! It took you #{currentAttempt} attempts" interpolate println
                return
            )
            if (Math absolute(guess - target) <= hotRange,
                "Hot, within #{hotRange} numbers from the target" interpolate println,
                "Cold, more than #{hotRange} numbers away from the target" interpolate println
            )
            "Attempts remaining: #{allowedAttempts - currentAttempt}" interpolate println
        )
        "Attempts over, the target is #{target}" interpolate println
    )
)

Game make(4, 10, 3) start
