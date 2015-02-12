

class Die
  attr_accessor :face
  attr_reader :sides
  def initialize( sides = 4 )
    pass
  end

  def roll
    pass
  end
  def tell_properties
    pass
  end
end

class DiceGame
  attr_reader :dies
  def initialize
    @dies = []
  end

  def add_die(sides)
    pass
  end
  def roll_all
    pass
  end
  def on_the_table
    if dies == []
      pass
    else
      pass
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