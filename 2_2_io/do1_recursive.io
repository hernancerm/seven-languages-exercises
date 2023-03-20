findNthFibonacciNumberRecursive := method(previous, current, n,
    if(n == 1, output := previous)
    if(n == 2, output := current)
    if(n > 2,
        output := findNthFibonacciNumberRecursive(current, previous + current, n - 1)
    )
    output
)

findNthFibonacciNumber := method(n,
    findNthFibonacciNumberRecursive(1, 1, n)
)

findNthFibonacciNumber(1) println #=> 1
findNthFibonacciNumber(4) println #=> 3
findNthFibonacciNumber(6) println #=> 8
