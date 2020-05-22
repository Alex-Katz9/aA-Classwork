require 'rspec_tester_file'
require 'byebug'
# let(:arr2) {[]}
describe "my_uniq" do 
    let(:arr) {[1, 5, 5, 2, 7, 7]}
    it "simple example" do 
        expect(my_uniq(arr)).to eq([1, 5, 2, 7])
    end

    it "doesn't modify original array" do
        expect {my_uniq(arr)}.to_not change {arr}
    end
end

describe "two_sum" do
    let(:arr) {[0, -1, 5, 2, 7, 7]}
    it "simple example" do
        expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0,4], [2,3]])
    end
   it "should pass in an array" do
    expect{two_sum('banana')}.to raise_error('invalid arg')
   end
    it "should not have duplicate indices in subarrays" do
        two_sum(arr).each do |sub| 
            
            expect(sub[1]).to_not eq(sub[0])
        end
    end

    # it "should pass in an array" do
    #     expect(two_sum(arr).to_not raise_error
    # # it "each indices pair should be sorted smaller before bigger index" do 
    # #     expect(two_sum(arr).each {|sub| sub[0] < sub[1]}).to eq(true)
    # # end
end
  
describe "my_transpose" do
    let(:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  it "should tanspose a 2D-array" do
    expect(my_transpose(rows)).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8])


  end

  describe "stock_picker" do 
    let(:stocks) {[20, 15, 12, 30, 30, 10]}
    it "outputs the most profitable pair of days on which to first buy the stock and then sell the stock" do 
        expect(stock_picker(:stocks)).to include([2, 3], [2, 4])
    end
end
