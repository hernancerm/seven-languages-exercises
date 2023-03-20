List myAverage := method(
    total := 0
    self foreach(number,
        if(number type != "Number",
            Exception raise("list contains #{number} which is not a Number." interpolate))
        total = total + number
    )
    total / (self size)
)

list(1, 2, 3, 4, 5) myAverage println #=> 3
list(1, "hi", 3, 4, 5) myAverage println #=> Exception: list contains hi which is not a Number.
