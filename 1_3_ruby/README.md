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
