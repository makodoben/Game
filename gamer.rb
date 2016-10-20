# The game is Rock-Paper-Scissors program in Ruby
class Player
  def initialize(name)
    @name = name
  end 
end

# 人類玩家的類別
class Human < Player
  def get_gesture
    input = gets.chomp
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
    input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "Lets play Paper Rock Scissors!" 
    puts "choose one: (P/R/S):"
  end

  def decide
    #邏輯判斷式
    win_situation = [['R', 'S'], ['S', 'P'], ['P', 'R']]
    sum           = [@gamer_human, @gamer_computer]

    if @gamer_human == @gamer_computer
      game_result = "It’s a tie!"
    elsif win_situation.include? sum
      game_result = "You win!"
    else
      game_result = puts "You lose!"
    end      
  end

  def get_player_gestures
    #取得玩家和電腦兩個物件的
    human           = Human.new("human")
    @gamer_human    = human.get_gesture
    computer        = Computer.new("computer")
    @gamer_computer = computer.get_gesture
  end

  def continue?
    #判斷玩家是否要繼續下一輪
    puts "Play Again(Y/N)"
    input = gets.chomp
    true if input == "Y" rescue false
  end

  def show_message(result)
    #印出結果
    puts result
  end
end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new

begin
  game.intro
  game.get_player_gestures
  game.show_message(game.decide)
end while game.continue?

