require 'colorize'
require_relative 'models/tic_tac_toe_board'

class TicTacToeGame

  def initialize
    @tic_tac_toe_board = TicTacToeBoard.new
    @board = @tic_tac_toe_board.board
  end

  def start_game
    show_header
    print_tit_tac_toe_board
    loop_game
  end

  def show_header
    puts '-----------------'.green
    puts '- Starting game -'.green
    puts '-----------------'.green
    puts ''
  end

  private

  def user_input
    puts 'Type x position: (Ex.: 0 0)'.green
    gets.chomp
  end

  def print_tit_tac_toe_board
    @tic_tac_toe_board.print
  end

  def loop_game
    while true do
      input_value = user_input

      break if input_value == 'end'

      position = input_value.split(' ')

      @tic_tac_toe_board.set_value(1, position[0].to_i, position[1].to_i)
      print_tit_tac_toe_board

      break if tic_tac_toe_winner
    end
  end

  def tic_tac_toe_winner
    winner = check_for_winner

    if winner == 1
      puts 'You won!!! Congratulations!!!'.blue
    elsif winner == 2
      puts "Computer won!!! Don't worry, you would never win!!!".red
    end

    return winner
  end

  def check_for_winner
    principal_diagonal = [@board[0][0], @board[1][1], @board[2][2]]
    secondary_diagonal = [@board[0][2], @board[1][1], @board[2][0]]

    # check diagonals
    return @board[0][0] if principal_diagonal.uniq.length == 1 && !principal_diagonal.include?(0)
    return @board[0][2] if secondary_diagonal.uniq.length == 1 && !secondary_diagonal.include?(0)

    @board.each_with_index do |line, index|
      # check lines
      return line[0] if line.uniq.length == 1 && !line.include?(0)

      # check columns
      column = [@board[0][index], @board[1][index], @board[2][index]]
      return @board[0][index] if column.uniq.length == 1 && !column.include?(0)
    end

    nil
  end

end

tic_tac_toe_game = TicTacToeGame.new
tic_tac_toe_game.start_game
