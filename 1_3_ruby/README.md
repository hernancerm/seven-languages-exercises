# Ruby. Day 3: Serious Change

## Do

#### Do 1

> Modify the CSV application to support an each method to return a `CsvRow` object. Use
> `method_missing` on that `CsvRow` to return the value for the column for a given heading.
>
> For example, for the file:
>
> ```text
> one, two
> lions, tigers
> ```
>
> allow an API that works like this:
>
> ```text
> csv = RubyCsv.new
> csv.each {|row| puts row.one}
> ```
>
> This should print `lions`.

Example usage of module [ActsAsCsv](./ActsAsCsv.rb) (see also
[shoppinglist.csv](./shoppinglist.csv)):

```ruby
ruby_day_3_dir_path = File.absolute_path(File.join('.', '1_3_ruby'))
$LOAD_PATH.push(ruby_day_3_dir_path)
require 'ActsAsCsv.rb'

class ShoppingList
  include ActsAsCsv
  acts_as_csv
end

shopping_list = ShoppingList.new(ruby_day_3_dir_path)
shopping_list.each {|row| puts row.product}
#=> 2b graphite pencil
#=> sketch paper
```

## Wrapping up

Ruby is a pure object-oriented, interpreted, dynamically and strongly typed, lexically scoped,
garbage-collected, general-purpose programming language.

Ruby can be considered a scripting language in the sense that it can substitute shell scripts and be
used for orchestration code. In fact, part of the original vision of the language is to support
scripting. Yukihiro Matsumoto (Matz), the creator of the langauge, [mentioned in
1999](https://www.ruby-lang.org/en/documentation/faq/1/), "I really wanted a genuine
object-oriented, easy-to-use scripting language". However, Ruby is a full programming language that
can be appropriate beyond scripting, for instance, for [web development](https://rubyonrails.org/)
and also for non performance-intensive lower-level tasks, such as building [parts of an X11 window
manager](https://ruby-doc.com/docs/ProgrammingRuby/) or a [package
manager](https://github.com/Homebrew/brew).  

The main weaknesses of Ruby are its performance and type safety. For instance, duck typing is great
for reducing boilerplate on subtype polymorphysim, but the implicitness of the contract comes at a
  runtime risk which could have been guarded against by a static type system.

Something unique about the languge is its vision. According to the author of the book, Matz has been
more concerned with improving the productivity of the programmers than the runtime performance of
the language. This is echoed in [Ruby's website](https://www.ruby-lang.org/en/), where the tagline
is "A Programmer's Best Friend" and the short initial description of the language mentions "focus on
simplicity and productivity".
