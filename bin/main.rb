#!/usr/bin/env ruby
# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Lint/UselessAssignment
#-------Variable declarations---------------
board_position = [1, 2, 3, 4, 5, 6, 7, 8, 9]

player_turn = 1

#-------------------------------------------

#--------Method definitions--------------
def ask_for_name_repeatedly(player_name)
  while player_name == ''
    puts "\nPlease enter your name:"
    player_name = gets.chomp
  end

  player_name
end

def ask_for_symbol_repeatedly(player_symbol)
  player_symbol = player_symbol.upcase

  until player_symbol.eql?('X') || player_symbol.eql?('O')
    puts "\nPlease enter either X or O as your symbol:"
    player_symbol = gets.chomp.upcase
  end

  player_symbol
end

def assign_player_two_symbol(player_symbol)
  player_symbol_two = 'O'

  player_symbol_two = 'X' if player_symbol == 'O'

  player_symbol_two
end

def ask_for_different_name(player_one_name, player_two_name)
  while player_two_name == '' || player_two_name.downcase.eql?(player_one_name.downcase)
    if player_two_name == ''
      player_two_name = ask_for_name_repeatedly(player_two_name)
    else
      puts "\nYou have the same name as #{player_one_name}!"
      puts 'Please enter a different name to avoid confusion, player two: '
      player_two_name = gets.chomp.downcase
    end
  end

  player_two_name.capitalize
end

def ask_for_correct_input(answer)
  until answer != '' && answer.eql?('y')
    puts 'Please enter Y or y to continue:'
    answer = gets.chomp.downcase
  end

  answer
end

def display_board(board_position)
  puts "\n\t#{board_position[0]} | #{board_position[1]} | #{board_position[2]}"
  puts "\n\t_   _   _"
  puts "\n\t#{board_position[3]} | #{board_position[4]} | #{board_position[5]}"
  puts "\n\t_   _   _"
  puts "\n\t#{board_position[6]} | #{board_position[7]} | #{board_position[8]}"
end

def ask_for_number_repeatedly(board_position, player_choice)
  until player_choice != '' && player_choice.match(/^[1-9]$+/)
    puts "\nPlease enter a position from 1-9 as your choice: "
    player_choice = gets.chomp

    if player_choice != '' && player_choice.match(/^[1-9]$+/) && !board_position.include?(player_choice.to_i)
      player_choice = ask_for_different_number(board_position, player_choice)
    end
  end

  player_choice
end

def ask_for_different_number(board_position, player_choice)
  until player_choice != '' && player_choice.match(/^[1-9]$+/) && board_position.include?(player_choice.to_i)
    puts "\nThat position is taken. Please enter another number as your choice:"
    player_choice = gets.chomp

    if player_choice == '' || !player_choice.match(/^[1-9]$+/)
      player_choice = ask_for_number_repeatedly(board_position, player_choice)
    end
  end
  player_choice
end

def play_game(board_position, player_name, player_symbol, player_choice)
  if player_choice == '' || !player_choice.match(/^[1-9]$+/)
    player_choice = ask_for_number_repeatedly(board_position, player_choice).to_i
  elsif player_choice != '' && player_choice.match(/^[1-9]$+/) && !board_position.include?(player_choice.to_i)
    player_choice = ask_for_different_number(board_position, player_choice).to_i
  else
    player_choice = player_choice.to_i
  end

  # fill the cell/position in the board with player_one_symbol according to position player_one chose;
  # update the board
  board_position = board_position.each_with_index do |position, index|
    board_position[index] = player_symbol if player_choice.eql?(position)
  end

  puts "#{player_name}: #{player_choice}"
  puts "#{player_name} is an integer? #{player_choice.is_a?(Integer)}"
  puts "Current position array: #{board_position}"

  display_board(board_position)

  puts ''
end
#----------------------------------------

puts '~~~~                               ~~~~'
puts '  ~ WELCOME TO MY TIC-TAC-TOE GAME! ~  '
puts '~~~~                               ~~~~'

puts "\nPlease enter your name, player one: "
player_one_name = gets.chomp

player_one_name = ask_for_name_repeatedly(player_one_name) unless player_one_name != ''

puts "\nAlright! Now, #{player_one_name}, please type in which symbol you want to use. 'X' or 'O':"
player_one_symbol = gets.chomp

if !player_one_symbol.eql?('X') || !player_one_symbol.eql?('O')
  player_one_symbol = ask_for_symbol_repeatedly(player_one_symbol)
end

player_two_symbol = assign_player_two_symbol(player_one_symbol)

puts "\nPlayer two symbol: #{player_two_symbol}"

puts "\nPlayer two, please enter your name:"
player_two_name = gets.chomp

if player_two_name == '' || player_two_name.downcase.eql?(player_one_name.downcase)
  player_two_name = ask_for_different_name(player_one_name, player_two_name)
end

players = { player_one_name => player_one_symbol, player_two_name => player_two_symbol }

puts "\nPlayers keys: #{players.keys} and Players values: #{players.values}"

puts "\nGreat! Now, #{player_two_name}, you'll use the #{player_two_symbol} symbol in this game."
puts '(Press any Y to continue)'
answer = gets.chomp.downcase

answer = ask_for_correct_input(answer) if answer == '' || !answer.eql?('y')

puts "\nHere\'s the board you\'ll be using. Type in the numbers in each cell to take that position."

display_board(board_position)

# create a loop that keeps playing the game when there's no winner yet (!is_a_win?)
# or when there is no draw (!is_a_draw?) yet
# for now, it keeps playing the game if there are still integers in the board/positions in the board (the cells)
until board_position.none? { |position| position.is_a?(Integer) }
  if player_turn.odd?
    puts "\nMake your move, #{player_one_name}"
    player_one_choice = gets.chomp

    play_game(board_position, player_one_name, player_one_symbol, player_one_choice)
  else
    puts "\nYour turn, #{player_two_name}"
    player_two_choice = gets.chomp

    play_game(board_position, player_two_name, player_two_symbol, player_two_choice)
  end

  player_turn += 1
end

# if there is a winner (is_a_win?), print message to congratulate the winner

# else if there is a draw (is_a_draw?), print a draw message
# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Lint/UselessAssignment
