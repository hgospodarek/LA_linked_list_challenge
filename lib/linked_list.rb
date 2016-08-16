require 'pry'
require_relative 'node'

class LinkedList

  def initialize
    @list_head = nil
  end

  def prepend(node_info)
    if @list_head
      new_node = Node.new(node_info, @list_head)
    else
      new_node = Node.new(node_info)
    end
    @list_head = new_node
  end

  def [](index)
    if index < 0
      current_node = nil
    else
      current_node = @list_head
    end

    index.times do
      if current_node.next_node.nil?
        return nil
      else
        current_node = current_node.next_node
      end
    end

    current_node
  end

  def to_s
    current_node = @list_head
    result = "LinkedList("
    until current_node.nil?
      result += "#{current_node.info}"
      unless current_node.next_node.nil?
        result += ", "
      end
      current_node = current_node.next_node
    end
    result.strip!
    result += ")"
  end

  def each
    current_node = @list_head
    until current_node.nil?
      yield current_node
      current_node = current_node.next_node
    end
  end

  def insert(index, node_info)
    if index == 0
      self.prepend(node_info)
    else
      node_before = self[index - 1]
      node_after = self[index]
      new_node = Node.new(node_info, node_after)
      node_before.next_node = new_node
    end
  end

  def remove(index)
    node_before = self[index - 1]
    node_after = self[index + 1]
    if node_before.nil?
      @list_head = node_after
    else
      node_before.next_node = node_after
    end
  end
end
