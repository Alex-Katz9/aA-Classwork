require_relative "tree_node.rb"

class KnightPathFinder
    attr_accessor :root_node, :considered_positions

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        build_move_tree
    end

    def self.valid_moves(position)
        valid_moves = []
        x, y = position
        potential_moves = [ [1, 2], [2, 1], [-1,-2], [-2, -1], [-1, 2], [1,-2], [2, -1], [-2, 1] ]
        potential_moves.each do |move|
            new_position = [x + move[0], y + move[1]]
            # if new_position[0] <= 7 && new_position[1] <= 7 && new_position[0] >= 0 && new_position[1] >= 0
            if (0..7).include?(new_position[0]) && (0..7).include?(new_position[1])
                valid_moves << new_position 
            end
        end
        valid_moves
    end

    def new_move_positions(position)
        moves = KnightPathFinder.valid_moves(position)
        new_moves = []
        moves.map do |move|
            unless self.considered_positions.include?(move)
                self.considered_positions << move
                new_moves << move
            end
        end
        new_moves
    end

    def build_move_tree
        queue = Array.new 
        queue.push(self.root_node) 
        until queue.empty? 
            parent = queue.shift
            new_moves = new_move_positions(parent.value)
            new_moves.each do |pos|
                child = PolyTreeNode.new(pos)
                parent.add_child(child)
                queue << child
            end
            
        end
    end


    def trace_path_back(bottom_node)
        queue = Array.new 
        queue.push(bottom_node)
        path = []
        until queue.empty?
            current_node = queue.shift 
            path << current_node.value
            queue << current_node.parent unless current_node.parent.nil?
        end

        path
    end

    def find_path(end_pos)
        goal_node = self.root_node.bfs(end_pos)
        result = trace_path_back(goal_node)
        result.reverse
    end

end


# kpf = KnightPathFinder.new([0,0])
# p kpf.build_move_tree([7, 7])
# p kpf.build_move_tree([3, 4])

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]