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

  def insert_at(index, node, current_node=@head, counter=0)
    if index < 0 || index >= self.count
      puts "Supplied index out of bounds; consider using append or prepend instead."
      return nil
    elsif counter == index -1
      node.next_node = current_node.next_node
      current_node.next_node = node
      @head = node if index == 0
    else
      insert_at(index, node, current_node.next_node, counter + 1)
    end
  end

  def remove_at(index, current_node=@head, counter=0)
    if index < 0 || index >= self.count
      puts "Supplied index out of bounds; consider using append or prepend instead."
      return nil
    elsif index == 0
      @head = @head.next_node
    elsif counter == index -1
      current_node.next_node = current_node.next_node.next_node
      @tail = current_node if current_node.next_node == nil
    else
      remove_at(index, current_node.next_node, counter + 1)
    end
  end
end

list = LinkedList.new
node_a = Node.new("A")
node_b = Node.new("B")
node_c = Node.new("c")
node_d = Node.new("d")
node_e = Node.new("e")
node_f = Node.new("Fart")

list.append(node_a)
list.append(node_b)
list.append(node_c)
list.append(node_d)
list.append(node_e)


puts list.to_s
list.insert_at(4, node_f)
puts list.to_s
list.remove_at(4)
puts list.to_s
puts list.tail
list.remove_at(4)
puts list.to_s
puts list.tail
