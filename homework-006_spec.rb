# Create our dice throwing app consisting of classes interacting with each other.

# Hard: write everything from scratch including tests
# Medium: pull the tests write the two classes yourself
# Easy use more information to solve the problem

# What classes do we need? How do they interact with each other?

# Write the tests for these classes. What types of tests do we need? Write tests for each class.
# For each class, test all public methods. Also test the creating of on instance of the class.
# Input you test should be: empty input, standard input, wrong input.
# In addition think about edge cases.

# To summarize the app functionality, we want to have:
# - user interface (command prompt)
# - creating a single Dice
# - rolling a single Dice
# - roll all dices we have for our DiceGame
# - display the result for each dice

# What classes do make most sense

# Create the tests first. If you don't feel comfortable with creating tests yourself you can
# pull them here.

# If you need additional hints, you find them here.

# If you're still stuck. You can find a basic structure here.

require_relative 'warmup-006'


describe "Die" do
  die = Die.new
  die2 = Die.new(sides: 10)
  die3 = Die.new(sides: "human")
  it "has 4 sides if no sides supplied" do
    expect(die.sides).to eq(4)
  end
  it "has sides" do
    expect(die2.sides).to eq(10)
  end
  it "has no face after creation" do
    expect(die.face).to be_nil
  end
  it "has a face after it's rolled" do
    expect(die.roll).to be_between(1, die.sides)
    expect(die.face).to be_between(1, die.sides)
  end
  it "tells face and sides" do
    die2.face = 7
    expect(die2.tell_properties).to eq("The die has face 7 and 10 sides.\n")
  end  
end

describe "DiceGame" do
  dice_game = DiceGame.new
  it "has no dies" do
    expect(dice_game.dies).to be_empty
  end
  it "tells that the game has no dies yet" do
    expect(dice_game.on_the_table).to eq("No dies were added to the game, yet.")
  end    
  it "adds a die" do
    dice_game.add_die(20)
    expect(dice_game.dies.find { |die| die.sides == 20 }).to_not be_nil
  end
  it "tells the properties of all dies" do
    dice_game.add_die(30)
    dice_game.add_die(14)
    expect(dice_game.on_the_table).to eq(dice_game.dies.map(&:tell_properties).join)
  end
  it "has been rolled and all dies have faces" do
    dice_game.roll_all
    expect(dice_game.dies.all? { |die| die.face }).to be_truthy
  end
end
