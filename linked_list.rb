class Node
  attr_accessor :next_node, :value

  def initialize(data=nil)
    @next_node = nil
    @value = data
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def append(new_node)
    if @head == nil
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(new_node)
    if @head == nil
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def count(current_node=@head, count=0)
    if current_node == nil
      return count
    else
      count += 1
      count(current_node.next_node, count)
    end
  end

  def at(index, current_node=@head, count=0)
    if count == index
      return current_node.value
    elsif current_node.next_node == nil
      return "Index not found."
    else
      at(index, current_node.next_node, count + 1)
    end
  end

  def pop(current_node=@head)
    if current_node.next_node.next_node == nil
      popped = @tail
      @tail = current_node
      current_node.next_node = nil
      return popped
    else
      pop(current_node.next_node)
    end
  end

  def contains?(query, current_node=@head)
    if current_node.value == query
      return true
    else
      if current_node.next_node == nil
        return false
      else
        contains?(query, current_node.next_node)
      end
    end
  end

  def find(data, current_node=@head, count=0)
    if current_node.value == data
      return count
    else
      if current_node.next_node == nil
        return "Query not found."
      else
        count += 1
        find(data, current_node.next_node, count)
      end
    end
  end

  def to_s(output="", current_node=@head)
    if current_node == nil
      output << "nil"
      return output
    else
      output << "#{current_node} -> "
      to_s(output, current_node.next_node)
    end
  end
end


list = LinkedList.new
node_a = Node.new("A")
node_b = Node.new("B")
node_c = Node.new("c")
node_d = Node.new("d")
node_e = Node.new("e")

list.append(node_a)
list.append(node_b)
list.append(node_c)
list.append(node_d)
list.append(node_e)

puts list.to_s
