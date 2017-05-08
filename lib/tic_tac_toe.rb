class TicTacToe
  def initialize
    board = []
    9.times{board << " "}
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  # Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index user_input
    user_input.to_i - 1
  end

  def move index, current_player
    @board[index] = current_player
  end

  def position_taken? location
    @board[location] != " " && @board[location] != ""
  end

  def valid_move? index
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid input!"
      turn
    end
  end

  def turn_count
    turns = 0
    @board.each { |cell| turns += 1 if cell != " " }
    turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" ||
         @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return win_combination
      end
    end
    return nil
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
   !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    @board[won?[0]] if won?
  end

  # Define your play method below
  def play
    counter = 0
    until over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

end