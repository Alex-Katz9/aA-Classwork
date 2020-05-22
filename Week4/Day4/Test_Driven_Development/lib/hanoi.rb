#2D array with 3 subs; 1st sub initially == [4, 3, 2, 1]
#rules: can never have a smaller number before larger in any sub
#can only move one ele at a time
#last sub aka arr[2]== [4, 3, 2, 1]

class TowersOfHanoiGame
    attr_reader :towers
    def initialize(towers=[[4, 3, 2, 1], [], []])
        @towers = towers  
    end
    def check
        self.towers.each do |sub|
          raise "cant stack larger on top of smaller" if sub.sort.reverse != sub 
        end
    end
end