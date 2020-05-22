require 'hanoi'
require 'byebug'

describe TowersOfHanoiGame do
    subject(:game_instance) {TowersOfHanoiGame.new}
    let(:bad_towers) {TowersOfHanoiGame.new([[3, 2, 1, 4], [], []])}

    describe "#won?" do

        it "game is won, when all discs are moved to 3rd sub-array in order" do
            expect(game_instance).to eq(true)
        end
    end

   

    describe "#move" do
        it "should raise error if larger disc is placed on smaller disc" do
            
            # game_instance.towers.each do |sub|
                expect{bad_towers.check}.to raise_error("cant stack larger on top of smaller")
            # end
        end
        it "each move should only take an upper disc from one stack and place on another stack (empty or otherwise" do
            expect{game_instance.move(0, 1)}.to_not raise_error
        end

    #[[][][4, 3, 2, 1]]
    end
end
