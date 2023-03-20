findNthFibonacciNumberRecursive := method(previous, current, n,
    # `ifTrue` and `ifFalse` as alternatives to `if`. See:
    # https://iolanguage.org/guide/guide.html#Control-Flow-true-false-and-nil
    (n == 1) ifTrue(return previous)
    (n == 2) ifTrue(return current)
    findNthFibonacciNumberRecursive(current, previous + current, n - 1)
)

findNthFibonacciNumber := method(n,
    findNthFibonacciNumberRecursive(1, 1, n)
)

findNthFibonacciNumber(1) println #=> 1
findNthFibonacciNumber(4) println #=> 3
findNthFibonacciNumber(6) println #=> 8
