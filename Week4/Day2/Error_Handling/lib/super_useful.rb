# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeNotFruitError < StandardError
  def initialize(message = nil)
    super
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeNotFruitError
  else
    raise ArgumentError.new('that is not a fruit')
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  begin
    reaction(maybe_fruit)
  rescue CoffeeNotFruitError => err
    p err.message
    maybe_fruit = gets.chomp
    retry
  end

end

# PHASE 4
class BestFriend


  # @param [String] name <description>
  # @param [Integer] yrs_known <description>
  # @param [String] fav_pastime <description>
  #
  def initialize(name, yrs_known, fav_pastime)
    @name = name

    raise ArgumentError.new("Haven't known them long enough") if yrs_known < 5

    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    raise StandardError.new("No fav_pastime given") if @fav_pastime.empty?
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    raise StandardError.new("No name given") if @name.empty?
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end


