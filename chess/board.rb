require_relative 'piece.rb'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) {Array.new}}
    nulls = @grid[2..5]
    (0..7).each do |r|
      @grid[r].each do |sq|
        if r.between?(2, 5)
          @grid[r].each {|arr| arr << NullPiece.new}
        else
          @grid[r].each {|arr| arr << Piece.new}
        end
      end
     end
   end

  def display
    p @grid
  end
end
