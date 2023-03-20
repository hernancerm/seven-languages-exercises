matrix := list(
    list(1, 2, 3), # sum:   6
    list(3, 4, 5), # sum:   12
    list(6, 7, 8)  # sum:   21
                   # total: 39
)

matrixSum := method(matrix, matrix map(sum) sum)

matrixSum(matrix) println #=> 39
