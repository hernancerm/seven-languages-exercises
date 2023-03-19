# Ruby. Day 1: Finding a Nanny

## Find

### Find 1

> The Ruby API

<https://rubyapi.org/3.1>

### Find 2

> The free online version of Programming Ruby: The Pragmatic Programmer’s Guide

<https://ruby-doc.com/docs/ProgrammingRuby/>

### Find 3

> A method that substitutes part of a string

`gsub`: Do not mutate the string.

```ruby
phrase = 'Ruby is boring'
p phrase
#=> "Ruby is boring"
p phrase.gsub(/boring/, 'fun')
#=> "Ruby is fun"
p phrase
#=> "Ruby is boring"
```

`gsub!`: Mutate the string.

```ruby
phrase = 'Ruby is boring'
p phrase
#=> "Ruby is boring"
p phrase.gsub!(/boring/, 'fun')
#=> "Ruby is fun"
p phrase
#=> "Ruby is fun"
```

From the [Ruby 3.1 API documentation](https://rubyapi.org/3.1/o/String.html#method-i-gsub):

> In general, if there exist both bang and non-bang version of method, the bang! mutates and the
> non-bang! does not.

### Find 4

> Information about Ruby's regular expressions

<https://rubyapi.org/3.1/o/regexp>

### Find 5

> Information about Ruby's ranges

<https://rubyapi.org/3.1/o/range>

## Do

### Do 1

> Print the string "Hello, world."

```ruby
puts 'Hello, world.'
#=> Hello, world.
```

### Do 2

> For the string "Hello, Ruby," find the index of the word "Ruby."

```ruby
p 'Hello, Ruby'.index(/Ruby/)
#=> 7
```

Ruby is 0-indexed.

### Do 3

> Print your name ten times

```ruby
(1..10).each do |i|
  puts 'Hernán'
end
#...
#=> Hernán
#=> Hernán
#=> Hernán
```

### Do 4

> Print the string "This is sentence number 1," where the number 1 changes from 1 to 10

```ruby
(1..10).each do |i|
  puts "This is sentence number #{i},"
end
#...
#=> This is sentence number 8,
#=> This is sentence number 9,
#=> This is sentence number 10,
```

### Do 5

> Run a Ruby program from a file

Simply provide the file path to the `ruby` command. For example:

```shell
ruby ./1_1_ruby/hello.rb
```

Output:

```text
Hello, World!
```


### Do 6

> Bonus problem: If you’re feeling the need for a little more, write a program that picks a random
> number. Let a player guess the number, telling the player whether the guess is too low or too
> high.
>
> (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the
> keyboard that you can translate to an integer.)

Try out [bonus.rb](./bonus.rb): `ruby ./1_1_ruby/bonus.rb`
