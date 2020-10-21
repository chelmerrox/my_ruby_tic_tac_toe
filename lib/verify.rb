=begin
class Verify < Board 
  attr_accessor :board

  def initialize (board)
    @board = board
  end

  def winning_board(board)
    #win_board = [
     #['1','2','3'],
     #['4','5','6'],
     #['7','8','9'],  
     #['1','4','7'],
     #['2','5','8'],
     #['3','6','9'],
     #['1','5','9'],
     #['3','5','7']     
   #]

    win_board = [
     [@board[0], @board[1], @board[2]],
     [@board[3], @board[4], @board[5]],
     [@board[6], @board[7], @board[8]],
     [@board[0], @board[3], @board[6]],
     [@board[1], @board[4], @board[7]],
     [@board[2], @board[5], @board[8]],
     [@board[0], @board[5], @board[8]],
     [@board[2], @board[4], @board[6]]
    ]

    win_board
  end

  def is_a_win?
    winning_board(@board).each do |win_board|
      win = win_board.all? { |value| value == 'X' || value == 'O' }

      return win if win == true
    end
  end

  def is_a_draw?
    winning_board(@board).each do |draw_board|
      win = draw_board.all? { |value| value == 'X' || value == 'O' }

      return win if win == false
    end
  end
end
=end
