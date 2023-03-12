# Ruby. Day 2: Floating Down from the Sky

## Find

### Find 1

> Find out how to access files with and without code blocks. What is the benefit of the code block?

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

By not using a code block:

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

### Find 2

> How would you translate a hash to an array? Can you translate arrays to hashes?

Hash to array, by creating a matrix:

```ruby
person = {
  first_name: 'Hernán',
  last_name: 'Cervera',
}
def hash_to_array(hash)
  output = []
  hash.each {|pair| output.push(pair) }
  output
end
p hash_to_array(person)
#=> [[:first_name, "Hernán"], [:last_name, "Cervera"]]
```

Array to hash, by using indices as keys:

```ruby
people = ['Hernán', 'Gladys']
def array_to_hash(array)
  output = {}
  array.each_with_index do |value, index|
    output[index] = value
  end
  output
end
p array_to_hash(people)
#=> {0=>"Hernán", 1=>"Gladys"}
```

### Find 3

> Can you iterate through a hash?

Yes, by using the `each` method:

```ruby
person = {
  first_name: 'Hernán',
  last_name: 'Cervera',
}
person.each {|value| p value}
#=> [:first_name, "Hernán"]
#=> [:last_name, "Cervera"]
```

### Find 4

> You can use Ruby arrays as stacks. What other common data structures do arrays support?

List:

```ruby
list = [ :hernan, "Gladys", 42 ]
p list
#=> [:hernan, "Gladys", 42]
```

Queue (FIFO):

```ruby
queue = [ :hernan, :gladys, :elvia ]
p queue.shift()
p queue.shift()
p queue.shift()
p queue
#=> :hernan
#=> :gladys
#=> :elvia
#=> []
```

Dequeue (FIFO & LIFO):

```ruby
dequeue = [ :hernan, :gladys, :elvia ]
p dequeue.shift()
p dequeue.pop()
p dequeue
#=> :hernan
#=> :elvia
#=> [:gladys]
```

## Do

### Do 1

> Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now,
> do the same with each_slice in Enumerable.

`each`:

```ruby
numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ]
batches = []
current_batch = []
numbers.each do |number|
  current_batch.push(number)
  if current_batch.length == 4
    batches.push(current_batch)
    current_batch = []
  end
end
batches.each {|batch| p batch.join(",")}
#=> "1,2,3,4"
#=> "5,6,7,8"
#=> "9,10,11,12"
#=> "13,14,15,16"
```

`each_slice`:

```ruby
numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ]
numbers.each_slice(4) {|numbers_slice| p numbers_slice.join(",")}
#=> "1,2,3,4"
#=> "5,6,7,8"
#=> "9,10,11,12"
#=> "13,14,15,16"
```

### TODO: Do 2

> The Tree class was interesting, but it did not allow you to specify a new tree with a clean user
> interface. Let the initializer accept a nested structure of hashes. You should be able to specify
> a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child
> 3' => {}, 'child 4' => {} } } }.

### Do 3

> Write a simple grep that will print the lines of a file having any occurrences of a phrase
> anywhere in that line. You will need to do a simple regular expression match and read lines from a
> file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

Example usage of [grep.rb](./grep.rb):

```bash
ruby ./1_2_ruby/grep.rb TRACE ./1_2_ruby/file.log
#=> 9: 03/22 08:51:06 TRACE  :...read_physical_netif: Home list entries returned = 7
#=> 25: 03/22 08:51:06 TRACE   :.....mailslot_create: creating mailslot for RSVP
#=> 29: 03/22 08:51:06 TRACE   :....mailbox_register: mailbox allocated for rsvp-udp
```
