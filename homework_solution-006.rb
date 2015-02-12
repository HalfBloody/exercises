

class Die
  attr_accessor :face
  attr_reader :sides
  def initialize( args = {} )
    args = defaults.merge(args)
    @sides = args[:sides]
  end
  def defaults
    { sides: 4 }
  end
  def roll
    @face = rand(1..sides)
    @face
  end
  def tell_properties
    "The die has face #{face} and #{sides} sides.\n"
  end
end

class DiceGame
  attr_reader :dies
  def initialize
    @dies = []
  end

  def add_die(sides)
    dies << Die.new(sides: sides)
  end
  def roll_all
    dies.each { |die| die.roll }
  end
  def on_the_table
    if dies == []
      return "No dies were added to the game, yet."
    else
      dies.map(&:tell_properties).join
    end
  end
end

class DiceGameInterface
  def initialize
    @dice_game = DiceGame.new
    start
    return nil
  end
  def start
    while true
      p "Enter number of dice sides for your next dice"
      input = gets.chomp.to_i
      if input >= 4
        @dice_game.add_die(input)
        "Die with #{input} sides added to game."
      elsif input == 0
        @dice_game.roll_all
        puts @dice_game.on_the_table
        break
      else
        "Wrong input"
      end
    end
  end
end