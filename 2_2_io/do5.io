# Matrix is being auto-imported, see: https://iolanguage.org/guide/guide.html#Importing
people := Matrix clone

people dim(2, 3)
people set(0, 2, "Trinity")
people set(1, 2, "Agent Smith")

people get(0, 0) println #=> nil
people get(0, 2) println #=> Trinity
people get(1, 2) println #=> Agent Smith
