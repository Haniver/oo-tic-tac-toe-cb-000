class TicTacToe
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
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] != "" && @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == 'X' || token == 'O'}
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] != "" && @board[combination[0]] != " " && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        return combination
      end
    end
    return false
  end

  def full?
    @board.all? {|cell| cell != "" && cell != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    while !over? do
      display_board
      turn
    end
    the_winner = winner
    if the_winner == 'X'
      puts "Congratulations X!"
    elsif the_winner == 'O'
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end