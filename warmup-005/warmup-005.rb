# Go to your ruby colearning warmup exercises folder
# Once there create a folder and name it warmup-005
# Inside this folder create two files: one titled warmup-005.rb and the other
# warmup-005_spec.rb

# To get yourself into the test-first habit, first copy the tests in
# https://github.com/gustavoguimaraes/ruby-colearning-warmup-exercises/blob/master/warmup-005/warmup-005_spec.rb
# and add to your warm-005_spec.rb. Write an additional test to it.
# You can use the test that is already written as a reference.

# Your task is to create a "dice roller bucket". See README.md

#Push your code to github.


dies = []

def roll_die(sides)
  # replace this fake implementation of
  # 6 sides die that always return 5
  {
    sides: sides, # number of sides
    face: (1..sides).to_a.sample   # a random number between 1 and sides (inclusive)
  }
end

def roll_bucket(dice_sides)
  rolled_dices = []
  dice_sides.each do |sides|
    rolled_dices << roll_die(sides)
  end
  rolled_dices
  # return an array of rolled dice

end

def on_the_table(rolled_dices)
  res = ""
  if rolled_dices.length < 1
    res = "No dice in the bucket"
  else
    rolled_dices.each do |die|
      res += talk_about_dice(die)
    end
    res += count_dice_faces(rolled_dices)
  end
  res
end
def talk_about_dice(dice)
  "Your #{dice[:sides]}-sided die shows the value of #{dice[:face]}\n"
end
def count_dice_faces(dices)
  dices.reduce { |sum, x| sum[:face] + x[:face] }
end

# In a loop, ask the user for the dice sides
# When the user enter 0, roll the dice in the basket and show the result
while true
  p "Enter number of dice sides for your next dice"
  input = gets.chomp.to_i
  if input >= 4
    dies << input
  elsif input == 0
    rolled_dices = roll_bucket(dies)
    puts on_the_table(rolled_dices)
    break
  else
    "Wrong input"
  end
end