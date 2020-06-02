class Node
  attr_accessor :val, :next_node

  def initialize(val, next_node)
    @val = val
    @next_node = next_node
  end
end

class LinkedList
  def initialize(elem)
    @head = Node.new(elem, nil)
  end

  # add : Object ->
  # Adds an elements to the linked list
  def add(elem)
    raise NotImplementedError
  end

  # to_s : -> String
  # Returns a string representation of the linked list
  # (the format should be as irb would print it)
  def to_s
    raise NotImplementedError
  end
end
