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
    if count == index - 1
      return current_node.value
    elsif current_node.next_node == nil
      return "Index not found."
    else
      at(index, current_node.next_node, count + 1)
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

puts list.count
puts list.at(3)
