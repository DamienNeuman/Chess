require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"
require "byebug"

class Display
  attr_reader :board, :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
    @board = board
  end
  def render()
    #debugger
    board.grid.each do |row|
      r = []
      row.each_index do |idx|
          if [row, idx] == cursor.cursor_pos
            r << row[idx].colorize(:background => :light_yellow)
          else
            r << row[idx]
          end
      end
      puts r.join(" ")
    end
  end

  def run

      loop do
        #system('clear')
        render
        cursor.get_input
        p cursor.cursor_pos
        p cursor.selected
      end
  end

end



if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.run
end
