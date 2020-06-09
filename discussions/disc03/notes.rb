# Regular expression examples

line = 'Hey you! Out there in the cold, feeling lonely feeling old, can you hear me!'
regex = /(?<feelings>(?:(?:feeling) (?:lonely|old).?))/

puts "The line is #{line}\n and the regular expression is #{regex.inspect}"

# The code block examples

## Simple array

### When to use do

# When the code block is multi line then use do
arr = [1, 2, 3, 4, 5]
arr.each do |x|
  t = x + 1
  p t
end

### When to use { }

# When the code block is single lined use { }
arr = [1, 2, 3, 4]
arr.each { |x| puts x }

## accepting code blocks

# Using codeblocks as abstractions

puts 'Using code blocks as abstractions'
def foo
  puts "foo: #{yield 1}"
  puts "foo: #{yield 2}"
  puts "foo: #{yield 3}"
end

foo do |x|
  puts x
  x + 1
end

## Using codeblocks within codeblocks
def bar(arr)
  arr.each do |x|
    puts "bar: Yielding #{x}"
    puts "bar: The block gave the first yield #{yield x}"
    puts "bar: The block gave the second yield #{yield 10 * x}"
  end
end

bar([1, 2, 3, 4, 5]) do |x|
  puts "top: Doing something with #{x}"
  [x]
end
