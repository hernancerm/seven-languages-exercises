findNthFibonacciNumber := method(n,
    previous := 1
    current := 1
    output := nil

    if(n == 1, output = previous)
    if(n == 2, output = current)

    if(output == nil,
        for(_, 1, n - 2,
            temp := current
            current = previous + current
            previous = temp
        )
        output = current
    )
    output
)

findNthFibonacciNumber(1) println #=> 1
findNthFibonacciNumber(4) println #=> 3
findNthFibonacciNumber(6) println #=> 8
