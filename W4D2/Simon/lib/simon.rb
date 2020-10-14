class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    p "let's play the game"
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence unless game_over
    require_sequence unless game_over
    round_success_message unless game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    p @seq
    sleep 3
    system("clear")
  end

  def require_sequence
    p "Please tell me what was on the screen"
    res = gets.chomp()
    res = res.split(" ")
    @game_over = true if res != seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p "Ok congrats, you finished this round"
  end

  def game_over_message
    p "eh-oh pratice makes perfect"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
