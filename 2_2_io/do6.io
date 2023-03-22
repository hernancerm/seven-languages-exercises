Matrix transpose := method(
    transposed := Matrix clone
    transposed dim(self rows, self cols)
    self value foreach(i, list,
        list foreach(j, number,
            transposed set(i, j, number)
        )
    )
    transposed
)

# Example showing the following transposition:
# A =      A^T =
# ┍     ┑  ┍       ┑
# │ 1 2 │  │ 1 3 5 │
# │ 3 4 │  │ 2 4 6 │
# │ 5 6 │  ┕       ┙
# ┕     ┙

A := Matrix clone
A dim(2, 3)
A set(0, 0, 1)
A set(1, 0, 2)
A set(0, 1, 3)
A set(1, 1, 4)
A set(0, 2, 5)
A set(1, 2, 6)

A value println
#=> list(list(1, 2), list(3, 4), list(5, 6))
A transpose value println
#=> list(list(1, 3, 5), list(2, 4, 6))
((A get(0, 1)) == A transpose get(1, 0)) println
#=> true
