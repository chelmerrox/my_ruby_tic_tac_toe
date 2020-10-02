#!/usr/bin/env ruby
#--------Method definitions--------------
  def ask_for_name_repeatedly(player_name)
   while player_name == ''
     puts 'Please enter your name: '
     player_name = gets.chomp
   end

   player_name
  end

  def ask_for_symbol_repeatedly(player_symbol)
    player_symbol = player_symbol.upcase

    until player_symbol == 'X' || player_symbol == 'O'
      puts 'Please enter either X or O as your symbol:'
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
    while player_two_name == '' || player_two_name.eql?(player_one_name)
      if player_two_name == ''
        player_two_name = ask_for_name_repeatedly(player_two_name)
      else
        puts ''
        puts "You have the same name as #{player_one_name}!"
        puts 'Please enter a different name to avoid confusion, player two: '
        player_two_name = gets.chomp
      end
    end

    player_two_name
  end

  def display_board(position)
    puts "#{position[0]} | #{position[1]} | #{position[2]}"
    puts '_   _   _'
    puts ''
    puts "#{position[3]} | #{position[4]} | #{position[5]}"
    puts '_   _   _'
    puts ''
    puts "#{position[6]} | #{position[7]} | #{position[8]}"
  end

  def ask_for_number_repeatedly(player_choice)
    until player_choice != '' && player_choice.match(/^[1-9]$+/)
      puts 'Please enter a position from 1-9 as your choice: '
      player_choice = gets.chomp
    end
    
    player_choice.to_i
  end

#----------------------------------------



#-------Class and Module definitions------
  #define a class

#-----------------------------------------

puts "~~~~                               ~~~~"
puts "  ~ WELCOME TO MY TIC-TAC-TOE GAME! ~  "
puts "~~~~                               ~~~~"

puts ''

puts "Please enter your name, player one: "
player_one_name = gets.chomp

puts ''

player_one_name = ask_for_name_repeatedly(player_one_name) unless player_one_name != ''

puts ''

puts "Alright! Now, #{player_one_name}, please type in which symbol you want to use. 'X' or 'O':"
player_one_symbol = gets.chomp

puts ''

player_one_symbol = ask_for_symbol_repeatedly(player_one_symbol) unless player_one_symbol == 'X' || player_one_symbol == 'O'

puts ''

player_two_symbol = assign_player_two_symbol(player_one_symbol)

puts "Player two symbol: #{player_two_symbol}"

puts ''

puts 'Player two, please enter your name: '
player_two_name = gets.chomp

puts ''

player_two_name = ask_for_different_name(player_one_name, player_two_name) if player_two_name == '' || (player_two_name).eql?(player_one_name)

puts ''

players = { player_one_name => player_one_symbol, player_two_name => player_two_symbol }

puts "Players keys: #{players.keys} and Players values: #{players.values}"

puts ''

puts "Great! Now, #{player_two_name}, you'll use the #{player_two_symbol} symbol in this game. (Press any key to continue)"
answer = gets.chomp

puts ''

puts 'Here\'s the board you\'ll be using. Type in the numbers in each cell to take that position.'

position = [1,2,3,4,5,6,7,8,9]

puts ''

# create a loop that keeps playing the game when there's no winner yet or when there is no draw yet
loop do 
   display_board(position)

   puts ''

   puts "Make your move, #{player_one_name}"
   player_one_choice = gets.chomp

  if player_one_choice == '' || !player_one_choice.match(/^[1-9]$+/)
    player_one_choice = ask_for_number_repeatedly(player_one_choice)
  else
    player_one_choice = player_one_choice.to_i
  end

   puts "player_one_choice: #{player_one_choice}"
   puts "player_one_choice is an integer? #{player_one_choice.is_a?(Integer)}"

   puts ''

   # ask for player_one's choice again if position has been taken

   # fill the cell in the board with player_one_symbol according to position player_one chose; update the board
   position = position.each_with_index { |cell, index| position[index] = player_one_symbol if player_one_choice == cell }

   # print the updated board
   display_board(position)

   #break if is_a_win? || is_a_draw?; for now it breaks when the board/all position array elements are not integers
   break if position.none? { |cell| cell.is_a?(Integer) }

   puts "Your turn, #{player_two_name}"
   player_two_choice = gets.chomp

  if player_two_choice == '' || !player_two_choice.match(/^[1-9]$+/)
    player_two_choice = ask_for_number_repeatedly(player_two_choice)
  else
    player_two_choice = player_two_choice.to_i
  end

   puts "player_two_choice: #{player_two_choice}"
   puts "player_two_choice is an integer? #{player_two_choice.is_a?(Integer)}"

   puts ''

   # ask for player_two's choice again if position has been taken

   position = position.each_with_index { |cell, index| position[index] = player_two_symbol if player_two_choice == cell }
end

# if there is a winner, print message to congratulate the winner

# else if there is a draw, print a draw message
