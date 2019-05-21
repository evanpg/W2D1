require "colorize"
require cursor.rb

class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)

  end

end