# Discussion 1: All the Rubyists

Due: Thursday June 02, 2020 23:59:59

Points: 50P/50SP/0S

## Part 1: Linked List

Finish the implementation of the linked list
in `list.rb`.

## Part 2: Bye Haters!

You will write the `RubyIdentifier` class
in `rubyist.rb`.
Here are the methods of this class.

### `add(name : String, loves_ruby : String) ->`

Takes in two strings, a name and that person loves Ruby.
If the name is already in the data structure it should not be added.
If `loves_ruby` is "Y" then the boolean `true` should be stored,
else the boolean `false` should be stored.

### `ruby_haters() -> Array`

Returns an array of the people who don't love Ruby.

### `delete_the_haters(names : Array) ->`

Deletes from the data structure all the people
in the `names` array
who don't like Ruby.

### `get_everyone() -> Array`

Returns an array of all the people in the data structure.
