class Node

  attr_accessor :info, :next_node

  def initialize(info, next_node = nil)
    @info = info
    @next_node = next_node
  end
end
