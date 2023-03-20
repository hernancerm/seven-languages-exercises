# Io. Day 1: Skipping School, Hanging Out

## Find

### Find 1

<table><tr><td>
Some Io example problems.
</table></tr></td>

<https://gist.github.com/HerCerM/87a57c9a3f704e62b9d73361680f6730>

### Find 2

<table><tr><td>
An Io community that will answer questions.
</table></tr></td>

Now, in the year 2023, I could not find an alive community.

- [Reddit community](https://www.reddit.com/r/iolanguage/): Last post from a couple of years ago.
- [Yahoo community](http://web.archive.org/web/20140116115001/http://groups.yahoo.com/neo/groups/iolanguage/info):
  From the Wayback Machine. A [reddit post](https://www.reddit.com/r/iolanguage/comments/1drqe0/comment/cbldi9e/?utm_source=share&utm_medium=web2x&context=3)
  linked to this Yahoo group.

### Find 3

<table><tr><td>
A style guide with Io idioms.
</table></tr></td>

<https://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide>

The same wikibooks site has more useful information about Io.

## Answer

### Answer 1

<table><tr><td>
Evaluate <code>1 + 1</code> and then <code>1 + "one"</code>. Is Io strongly typed or weakly typed?
Support your answer with code.
</table></tr></td>

This is the execution of the requested expressions:

```io
1 + 1
#=> 2

1 + "one"
#=> Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
#=> ---------
#=> message '+' in 'Command Line' on line 1
```

Now, is Io strongly or weakly typed? What even is the distinction between strong and weak typing?
In the chapter 2 on "Day 1: Finding a Nanny", Bruce mentions the following about strong typing:

> Strongly typed languages check types for certain operations and check the types before you can do
> any damage. This check can happen when you present the code to an interpreter or a compiler or
> when you execute it. [...] So, Ruby is strongly typed, meaning you’ll get an error when types
> collide. — Bruce A. Tate.

To drive this point, Bruce used the Ruby example `4 + 'four'`, which raised the following type
error:

```io
TypeError: String can't be coerced into Fixnum
```

The type system characteristic shown in this example is that and implicit type conversion didn't
happen. Instead of coercion (an implicit type conversion), an error is thrown. The general tendency
of avoding coercion is what I gather Bruce refers to when saying that Ruby is strongly typed.
[TJ](https://github.com/tjdevries) has the same view:

> For Ruby, the way that I think about strongly typed, is that every particular instance of
> something like has a very particular type at that moment, and it's not going to get like coerced
> to other types and it's not going to get accidentally treated as those other types. Like, if it's
> a number, then right now it is a number. — TJ DeVries, from the [README book club Twitch stream](
> https://m.twitch.tv/videos/1727023194), at 54:45.

However, according to a [Wikipedia article](https://en.wikipedia.org/wiki/Strong_and_weak_typing)
and a [StackOverflow post](https://stackoverflow.com/a/2696369), there is no technical agreed
definition on what "weak" or "strong" typing mean. Regardless, under the understanding of "strong"
typing as the book proposes it, Io is strongly typed. Here are a few additional examples which show
coercion _not_ happening:

```io
1 + "1"
#=> Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
#=> ---------
#=> message '+' in 'Command Line' on line 1

1 == "1"
#=> false
```

### Answer 2

<table><tr><td>
Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with
code.
</table></tr></td>

Two different ways to answer this question are (1) whether some values are _equal to_ `true` or `false`,
and (2) whether the `if` method evaluates certain values to `true` or `false`.

Regarding (1), Io represents `true` and `false` as singletons. This can be discovered by cloning
both objects and inspecting their unique identifier using the method `uniqueHexId`.

```io
true0 := true clone
true0 == true
#=> true
true0 uniqueHexId
#=> 0x7fb6314349b0
true uniqueHexId
#=> 0x7fb6314349b0

false0 := false clone
false0 == false
#=> true
false0 uniqueHexId
#=> 0x7fb631434ba0
false uniqueHexId
#=> 0x7fb631434ba0
```

The clones are equal to the original objects, since both the clones and the originals are the same
objects. Since Io generally avoids coercion, `0`, `""` and `nil` are not equal to `true` or `false`.

```io
true == 0
#=> false
true == ""
#=> false
true == nil
#=> false

false == 0
#=> false
false == ""
#=> false
false == nil
#=> false
```

Regarding (2), the [docs](https://iolanguage.org/guide/guide.html#Control-Flow-true-false-and-nil)
mention the following about `if`:

> The condition is considered false if the condition expression evaluates to false or nil, and true
> otherwise.

Fun fact, this behavior is [consistent with Lua](https://www.lua.org/pil/2.2.html), one of the
languages that inspired Io.

So in an `if`, `0` and `""` (and anything other than false and nil) are evaluated to `true`, and
`nil` (and false) to `false`. Consequently, although these expressions are not evaluated to true in
the condition:

```io
if(0 == true, "Here!" println)
if("" == true, "Here!" println)
```

These are:

```io
if(0, "Here!" println)
#=> Here!
if("", "Here!" println)
#=> Here!
```

### Answer 3

<table><tr><td>
How can you tell what slots a prototype supports?
</table></tr></td>

First, what is a prototype? In object oriented prototype-based languages, like Io, a prototype is an
object, `P`, that is associated to another object, `O`. When an attribute, method, or any other
object construct, like a slot in Io, is accessed in `O`, it is first tried to be resolved in that
object. If `O` can't answer, for instance, because the method is not defined in that object, then
`P` is used as a next step for the lookup process. Since `P` is an object, it also has its own
prototype. If the lookup also failed on `P`, its prototype is used. This lookup chain is called the
prototype chain.

Io supports multiple prototypes on a single object, these can be learned by using the method
`protos`. The first prototype can be accessed using the method `proto`. Using the method `slotNames`
we can inspect the slots that a prototype supports:

```io
target := Object clone
WhoAmI := Object clone
WhoAmI who := "I don't know"

target prependProto(WhoAmI)
target protos map(type)
#=> list(WhoAmI, Object)

target proto slotNames
#=> list(type, who)
```

### Answer 4

<table><tr><td>
What is the difference between <code>=</code>, <code>:=</code>, and <code>::=</code>? When would you
use each one?
</table></tr></td>

All three are [assignment operators](https://iolanguage.org/guide/guide.html#Syntax-Assignment), in
the sense that they assign a value to a slot in an object. The `=` operator merely does this
assignment. If the slot does not exist, an exception is raised. The `:=` operator creates the slot
if it does not exist. Lastly, the `::=` operator creates the slot if it does not exist and also
    creates a setter method. Let's take a look at some examples.

Example for `=`:

```io
target = "I am new in this world"
#=>  Exception: Slot target not found. Must define slot using := operator before updating.
#=>  ---------
#=>  message 'updateSlot' in 'Command Line' on line 1
```

Example for `:=`:

```io
target := "I am new in this world"
getSlot("target")
#=> I am new in this world
```

Example for `::=`:

```io
target ::= "I am new in this world"
getSlot("target")
#=> I am new in this world
getSlot("setTarget")
#=> method(
#=>     target = call evalArgAt(0); self
#=> )
```

Regarding when to use each one, my guiding rule would be: Use the _least_ powerful operator that
satisfies the desired effect. For instance, if I know that a slot should already exist, I would use
`=`. Instead, if I'm defining a type, I want to create the slot, assign a default value and create a
setter method. For that I would use `::=`. The [Io style guide](
https://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide) recommends using setter methods for
write access.

## Do

### Do 1

<table><tr><td>
Run an Io program from a file.
</table></tr></td>

Simply provide the file path to the `io` command. For example:

```shell
io ./2_1_io/hello.io
```

Output:

```text
Hello, World!
```

### Do 2

<table><tr><td>
Execute the code in a slot given its name.
</table></tr></td>

According to the [docs](https://iolanguage.org/guide/guide.html#Introduction-Running-Scripts), the
`doString` method can be used to "evaluate a string in the context of a particular object". In the
code block below, when evaluating the message `start`, the implicit receiver of the message is the
object `Vehicle`.

```io
Vehicle := Object clone
Vehicle start := method("Vehicle is starting..." println)

Vehicle doString("start")
#=> Vehicle is starting...
```
