require "byebug"

class PolyTreeNode
    attr_reader :value
    attr_accessor :children, :parent

    def initialize(value)
        @value = value
        @parent = nil # dad
        @children = []
    end

    def parent=(parent_instance)
        if @parent.nil? 
             @parent = parent_instance
        else
            @parent.children.delete(self) 
            @parent = parent_instance
        end
       parent_instance.children << self unless parent_instance.nil?
    end

    def add_child(child_node)
        child_node.parent= self
    end

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise "Node is not a child."
        else
            child_node.parent = nil
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child_node|
            child_search = child_node.dfs(target_value)
            return child_search unless child_search == nil
        end
        nil
    end

    def bfs(target_value)
        line = Array.new
        line.push(self)
        until line.empty?
          first = line.shift
          if first.value == target_value
            return first
          else
            first.children.each {|child| line << child}
          end
        end
    end
end

class Queue
  def initialize
    @underlying_array = []
  end

  def enqueue(el)
    underlying_array.push(el)
    el
  end

  def dequeue
    underlying_array.shift
  end

  def peek
    underlying_array.first
  end

  private

  attr_reader :underlying_array
  
end

tree = PolyTreeNode.new("banana")
redwood = PolyTreeNode.new("apple")
palm = PolyTreeNode.new("coconut")

tree.parent = redwood

