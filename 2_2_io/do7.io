people := Matrix clone

people dim(2, 3)
people set(0, 2, "Trinity")

file := Serializer write(people value, "./2_2_io/matrix.txt")
matrixDeserialized := Matrix clone
matrixDeserialized value := Serializer read(file)
matrixDeserialized get(0, 2) println #=> Trinity
