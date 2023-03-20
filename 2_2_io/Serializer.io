Serializer := Object clone
Serializer clone := Serializer

Serializer write := method(object, filePath,
    file := File with(filePath)
    file openForUpdating
    file write(object serialized)
    file close
)

Serializer read := method(file,
    file openForReading
    # I assume that a serialization file is always 1 line long.
    deserialization := file readLine
    file close
    doString(deserialization)
)
