# Day 2 Self-Study

## Find

#### How to access files with and without code blocks. What is the benefit of the code block?

This repository contains a file that we can use to explore this question: `./1_2_ruby/file.txt`.

Searching in the [Ruby 3.1 API documentation](https://rubyapi.org/3.1/o/String.html#method-i-gsub),
I only found one method which optionally accetps a block: `File.open`.

> With no associated block, File.open is a synonym for File.new. If the optional code block is
> given, it will be passed the opened file as an argument and the File object will automatically be
> closed when the block terminates. The value of the block will be returned from File.open.

By using a code block:

```ruby
file_lines = File.open('./1_2_ruby/file.txt') do |file|
    lines = []
    file.each {|line| lines.push("#{file.lineno}: #{line}") }
    lines
end
p file_lines
#=> ["1: Hi there.\n", "2: I hope you are having a nice day!\n"]
```

By **not** using a code block:

```ruby
file = File.open('./1_2_ruby/file.txt')
file_lines = []
file.each {|line| file_lines.push("#{file.lineno}: #{line}")}
p file_lines
#=> ["1: Hi there.\n", "2: I hope you are having a nice day!\n"]
```

A benefit of the code block is that it allows scoping variables within the block, leaving variables
outside of the block untouched. For example, let's consider that an `identifier` variable is already
present in the scope:

```ruby
identifier = 8018346
file_lines = File.open('./1_2_ruby/file.txt') do |file; identifier|
    lines = {}
    file.each do |line|
        identifier = file.lineno
        lines[identifier] = line
    end
    lines
end
p file_lines
p identifier
#=> {1=>"Hi there.\n", 2=>"I hope you are having a nice day!\n"}
#=> 8018346
```
