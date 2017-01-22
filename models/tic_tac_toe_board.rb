class TicTacToeBoard

  attr_accessor :board

  def initialize
    @board = []
    initialize_board
  end

  def initialize_board
    3.times do |line|
      @board << [0, 0, 0]
    end
  end

  def print
    @board.each_with_index do |line, index|
      puts "#{show_value(line[0])} | #{show_value(line[1])} | #{show_value(line[2])}"
      puts "----------" unless index == 2
    end

    puts ''
  end

  def reset
    @board = []
    initialize_board
  end

  def set_value(value, line_value, column_value)
    @board[line_value][column_value] = value
  end

  def positions_in_blank
    blank_positions = []

    @board.each_with_index do |line, l|
      line.each_with_index do |column, c|
        blank_positions << [l, c] if @board[l][c] == 0
      end
    end

    blank_positions
  end

  private

  def show_value(numerical_value)
    return 'X' if x_value?(numerical_value)
    return 'O' if o_value?(numerical_value)
    ' '
  end

  def x_value?(numerical_value)
    numerical_value == 1
  end

  def o_value?(numerical_value)
    numerical_value == 2
  end

end
