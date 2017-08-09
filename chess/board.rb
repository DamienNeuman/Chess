require_relative 'piece.rb'
require 'byebug'
require "colorize"
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8){'x'}}
    (0..7).each do |r|
      @grid[r].map! do |sq|
        if r.between?(2, 5)
          sq = "  "
        else
          sq = 'P'.colorize(:magenta)
        end
      end
     end
   end

   def move_piece(start_pos, end_pos)
     if self[start_pos] == nil
       raise "No piece at this position!"
     end

     x, y = end_pos

     unless x.between?(0,7) && y.between?(0, 7)
       raise "Not a valid board position!"
     end

     self[end_pos] = self[start_pos]
     self[start_pos] = nil

   end
  # def display
  #   p @grid
  # end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def in_bound(pos)[0,0]
    x,y = pos
    return false unless x.between?(0,7) && y.between?(0,7)
    true
  end
end
