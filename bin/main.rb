#!/usr/bin/env ruby
#-------Variable declarations---------------
  position = [1,2,3,4,5,6,7,8,9]

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

    until player_symbol == 'X' || player_symbol == 'O'
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
    while player_two_name == '' || (player_two_name.downcase).eql?(player_one_name.downcase)
      if player_two_name == ''
        player_two_name = ask_for_name_repeatedly(player_two_name)
      else
        puts "\nYou have the same name as #{player_one_name}!"
        puts 'Please enter a different name to avoid confusion, player two: '
        player_two_name = gets.chomp.downcase
      end
    end

    player_two_name.capitalize()
  end

  def display_board(position)
    puts "\n\t#{position[0]} | #{position[1]} | #{position[2]}"
    puts "\n\t_   _   _"
    puts "\n\t#{position[3]} | #{position[4]} | #{position[5]}"
    puts "\n\t_   _   _"
    puts "\n\t#{position[6]} | #{position[7]} | #{position[8]}"
  end

  def ask_for_number_repeatedly(position, player_choice)
    until player_choice != '' && player_choice.match(/^[1-9]$+/)
      puts "\nPlease enter a position from 1-9 as your choice: "
      player_choice = gets.chomp

      if player_choice != '' && player_choice.match(/^[1-9]$+/) && !position.include?(player_choice.to_i)
        player_choice = ask_for_different_number(position, player_choice)
      end
    end
    
    player_choice
  end

  def ask_for_different_number(position, player_choice)
    until player_choice != '' && player_choice.match(/^[1-9]$+/) && position.include?(player_choice.to_i)
      puts "\nThat position is taken. Please enter another number as your choice:"
      player_choice = gets.chomp

      if player_choice == '' || !player_choice.match(/^[1-9]$+/)
        player_choice = ask_for_number_repeatedly(position, player_choice)
      end
    end
    player_choice
  end

  def play_game(position, player_name, player_symbol, player_choice)
    if player_choice == '' || !player_choice.match(/^[1-9]$+/)
      player_choice = ask_for_number_repeatedly(position, player_choice).to_i
    elsif player_choice != '' && player_choice.match(/^[1-9]$+/) && !position.include?(player_choice.to_i)
      player_choice = ask_for_different_number(position, player_choice).to_i
    else
      player_choice = player_choice.to_i
    end

    # fill the cell in the board with player_one_symbol according to position player_one chose; update the board
    position = position.each_with_index { |cell, index| position[index] = player_symbol if player_choice == cell }

    puts "#{player_name}: #{player_choice}"
    puts "#{player_name} is an integer? #{player_choice.is_a?(Integer)}"
    puts "Current position array: #{position}"

    display_board(position)

    puts ''
  end
#----------------------------------------



#-------Class and Module definitions------
  #define a class

#-----------------------------------------

puts '~~~~                               ~~~~'
puts '  ~ WELCOME TO MY TIC-TAC-TOE GAME! ~  '
puts '~~~~                               ~~~~'

puts "\nPlease enter your name, player one: "
player_one_name = gets.chomp

player_one_name = ask_for_name_repeatedly(player_one_name) unless player_one_name != ''

puts "\nAlright! Now, #{player_one_name}, please type in which symbol you want to use. 'X' or 'O':"
player_one_symbol = gets.chomp

player_one_symbol = ask_for_symbol_repeatedly(player_one_symbol) unless player_one_symbol == 'X' || player_one_symbol == 'O'

player_two_symbol = assign_player_two_symbol(player_one_symbol)

puts "\nPlayer two symbol: #{player_two_symbol}"

puts "\nPlayer two, please enter your name:"
player_two_name = gets.chomp

player_two_name = ask_for_different_name(player_one_name, player_two_name) if player_two_name == '' || (player_two_name.downcase).eql?(player_one_name.downcase)

players = { player_one_name => player_one_symbol, player_two_name => player_two_symbol }

puts "\nPlayers keys: #{players.keys} and Players values: #{players.values}"

puts "\nGreat! Now, #{player_two_name}, you'll use the #{player_two_symbol} symbol in this game. (Press any key to continue)"
answer = gets.chomp

puts "\nHere\'s the board you\'ll be using. Type in the numbers in each cell to take that position."

display_board(position)

# create a loop that keeps playing the game when there's no winner yet (!is_a_win?) or when there is no draw (!is_a_draw?) yet
# for now, it keeps playing the game if there are still integers in the board/cells of the board
while !position.none? { |cell| cell.is_a?(Integer) }
  if player_turn.odd?
    puts "\nMake your move, #{player_one_name}"
    player_one_choice = gets.chomp

    play_game(position, player_one_name, player_one_symbol, player_one_choice)

    player_turn += 1
  else
    puts "\nYour turn, #{player_two_name}"
    player_two_choice = gets.chomp

    play_game(position, player_two_name, player_two_symbol, player_two_choice)

    player_turn += 1
  end
end

# if there is a winner, print message to congratulate the winner

# else if there is a draw, print a draw message
