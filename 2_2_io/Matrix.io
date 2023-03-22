Matrix := Object clone

Matrix dim := method(x, y,
    self value := List clone
    for(i, 1, y,
        row := List clone
        for(i, 1, x, row append(nil))
        self value append(row)
    )
    self cols := x
    self rows := y
    self
)

Matrix set := method(x, y, value,
    self value at(y) atPut(x, value)
)

Matrix get := method(x, y,
    self value at(y) at(x)
)
