# Ruby. Day 1: Finding a Nanny

<!--toc:start-->
- [Find](#find)
    - [The Ruby API](#the-ruby-api)
    - [The free online version of Programming Ruby: The Pragmatic Programmer’s Guide](#the-free-online-version-of-programming-ruby-the-pragmatic-programmers-guide)
    - [A method that substitutes part of a string](#a-method-that-substitutes-part-of-a-string)
    - [Information about Ruby's regular expressions](#information-about-rubys-regular-expressions)
    - [Information about Ruby's ranges](#information-about-rubys-ranges)
- [Do](#do)
    - [Print the string "Hello, world."](#print-the-string-hello-world)
    - [For the string "Hello, Ruby," find the index of the word "Ruby."](#for-the-string-hello-ruby-find-the-index-of-the-word-ruby)
    - [Print your name ten times](#print-your-name-ten-times)
    - [Print the string "This is sentence number 1," where the number 1 changes from 1 to 10](#print-the-string-this-is-sentence-number-1-where-the-number-1-changes-from-1-to-10)
    - [Run a Ruby program from a file](#run-a-ruby-program-from-a-file)
    - [Bonus problem](#bonus-problem)
<!--toc:end-->

## Find

#### The Ruby API

<https://rubyapi.org/3.1>

#### The free online version of Programming Ruby: The Pragmatic Programmer’s Guide

<https://ruby-doc.com/docs/ProgrammingRuby/>

#### A method that substitutes part of a string

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

#### Information about Ruby's regular expressions

<https://rubyapi.org/3.1/o/regexp>

#### Information about Ruby's ranges

<https://rubyapi.org/3.1/o/range>

## Do

#### Print the string "Hello, world."

```ruby
puts 'Hello, world.'
#=> Hello, world.
```

#### For the string "Hello, Ruby," find the index of the word "Ruby."

```ruby
p 'Hello, Ruby'.index(/Ruby/)
#=> 7
```

Ruby is 0-indexed.

#### Print your name ten times

```ruby
(1..10).each do |i|
    puts 'Hernán'
end
#...
#=> Hernán
#=> Hernán
#=> Hernán
```

#### Print the string "This is sentence number 1," where the number 1 changes from 1 to 10

```ruby
(1..10).each do |i|
    puts "This is sentence number #{i},"
end
#...
#=> This is sentence number 8,
#=> This is sentence number 9,
#=> This is sentence number 10,
```

#### Run a Ruby program from a file

Use the `ruby` command, e.g. `ruby m.rb`. The previous command fails since `m.rb` doesn't exist.

#### Bonus problem

> Bonus problem: If you’re feeling the need for a little more, write a program that picks a random
> number. Let a player guess the number, telling the player whether the guess is too low or too
> high.
>
> (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the
> keyboard that you can translate to an integer.)

[bonus.rb](./bonus.rb)
