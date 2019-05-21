require_relative "piece.rb"
class Board

  def initialize
    @grid = Array.new(8) { Array.new(8)}
    self.set_pieces
  end
  
  def set_pieces
    @grid.each_with_index do |row,i|
      row.each_with_index do |col, j|
        if i == 0 || i == 1 || i == 6 || i == 7
          @grid[i][j] = Piece.new("a")
        else
          @grid[i][j] = nil
        end
      end
    end
  end

  def print_board
    @grid.each_with_index do |row,i|
      row.each_with_index do |col, j|
          print self[[i,j]]
      end
      puts
    end
   
  end

  def move_piece(start_pos, end_pos)
    
    if !self[start_pos].is_a?(Piece)
      raise "invalid start position!"
    elsif end_pos[0] < 0 || end_pos[1] < 0 || end_pos[0] > 7 || end_pos[1] > 7 
      raise "invalid end position!"
    end
    @grid[end_pos[0]][end_pos[1]] = self[start_pos]
    @grid[start_pos[0]][start_pos[1]] = nil
  end

  def []=(pos)
    @grid[pos[0]][pos[1]]
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end
end

b = Board.new
sp = [1,1]
ep = [2,2]

b.move_piece(sp,ep)
