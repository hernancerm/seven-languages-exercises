findNthFibonacciNumber := method(n,
    previous := 1
    current := 1

    if(n == 1, return previous)
    if(n == 2, return current)

    for(_, 1, n - 2,
        temp := current
        current = previous + current
        previous = temp
    )
    current
)

findNthFibonacciNumber(1) println #=> 1
findNthFibonacciNumber(4) println #=> 3
findNthFibonacciNumber(6) println #=> 8
