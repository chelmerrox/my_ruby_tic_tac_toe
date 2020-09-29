#!/usr/bin/env ruby
#--------Method definitions--------------
  #define ask_for_name_repeatedly method which is to repetitively ask the player's
  #to give a name if they do not give a name
  def ask_for_name_repeatedly(player_name)
   while player_name == ''
     puts 'Please enter your name: '
     player_name = gets.chomp
   end

   player_name
  end

  #define ask_for_symbol_repeatedly method which is to repetitively ask player_one to 
  #choose & enter the symbol he/she wants to use
  def ask_for_symbol_repeatedly(player_symbol)
    until player_symbol == 'X' || player_symbol == 'O'
      puts 'Please enter either X or O as your symbol:'
      player_symbol = gets.chomp
    end
    player_symbol
  end

  #define assign_player_two_symbol which checks for the player_one_symbol chosen and determines 
  #which symbol should be assigned to player two
  def assign_player_two_symbol(player_symbol)
    player_two_symbol = 'O'
    
    if player_symbol == 'O'
      player_two_symbol = 'X'
    end

    player_two_symbol
  end

  #define ask_for_different_name method which is to repetitively ask player_two 
  #to give a different name if it's the same as player_one's name
  def ask_for_different_name(player_one_name, player_two_name)
    while player_two_name.eql?(player_one_name)
      puts "You have the same name as #{player_one_name}!"
      puts "Please enter a different name to avoid confusion, player two: "
      player_two_name = gets.chomp
    end

    player_two_name = ask_for_name_repeatedly(player_two_name) if player_two_name == ''

    while player_two_name.eql?(player_one_name)
      puts "You have the same name as #{player_one_name}!"
      puts "Please enter a different name to avoid confusion, player two: "
      player_two_name = gets.chomp
    end

    player_two_name
  end

  #define the display_board that prints/displays the board of the game
  def display_board(position)
    puts "#{position[0]} | #{position[1]} | #{position[2]}"
    puts '_   _   _'
    puts ''
    puts "#{position[3]} | #{position[4]} | #{position[5]}"
    puts '_   _   _'
    puts ''
    puts "#{position[6]} | #{position[7]} | #{position[8]}"
  end

#----------------------------------------



#-------Class and Module definitions------
  #define a class

#-----------------------------------------


# print a welcome message for this tic-tac-toe game
puts "~~~~                               ~~~~"
puts "  ~ WELCOME TO MY TIC-TAC-TOE GAME! ~  "
puts "~~~~                               ~~~~"

puts ''

# Ask for player_ones's name
puts "Please enter your name, player one: "
# player_one gives his/her name
player_one_name = gets.chomp

puts ''

# if player_one doesn't give a name, then call the ask_for_name_repeatedly method
player_one_name = ask_for_name_repeatedly(player_one_name) unless player_one_name != ''

puts ''

# ask player_one which symbol he/she wishes to use: symbol_one = 'X' or symbol_two = 'O'
puts "Alright! Now, #{player_one_name}, please type in which symbol you want to use. 'X' or 'O':"
player_one_symbol = gets.chomp

puts ''

# if player_one doesn't give 'X' or 'O', the call ask_for_symbol_repeatedly method
player_one_symbol = ask_for_symbol_repeatedly(player_one_symbol) unless player_one_symbol == 'X' || player_one_symbol == 'O'

puts ''

# based on player_one's answer above, assign the symbol to player_one and 
# the opposite to player_two
player_two_symbol = assign_player_two_symbol(player_one_symbol)

puts "Player two symbol: #{player_two_symbol}"

puts ''

# Ask for player_two's name
puts 'Player two, please enter your name: '
# player_two gives his/her name
player_two_name = gets.chomp

puts ''

# if player_two doesn't give a name, then call the ask_for_name_repeatedly(player_name) method
#player_two_name = ask_for_name_repeatedly(player_two_name) unless player_one_name != ''

#puts ''

# if player_two's name is the same as player_one's, then call the ask_for_different_name method
# player_two_name = ask_for_different_name(player_one_name, player_two_name) if (player_two_name).eql?(player_one_name)

if player_two_name == ''
  player_two_name = ask_for_name_repeatedly(player_two_name)
elsif (player_two_name).eql?(player_one_name)
  player_two_name = ask_for_different_name(player_one_name, player_two_name)
end  

puts ''

# print a message for player two to remind him/her of which symbol is assigned to him/her
puts "Great! Now, #{player_two_name}, you'll use the #{player_two_symbol} symbol in this game. (Press any key to continue)"
answer = gets.chomp

puts ''

# print a message telling the player's that the board is printed below
puts 'Here\'s the board you\'ll be using. Type in the numbers in each cell to take that position.'

position = [1,2,3,4,5,6,7,8,9]

puts ''

# print/display the board
display_board(position)

# create a loop that keeps playing the game when there's no winner or when there is no draw

   # ask for player_one's choice

   # player one gives choice from the postions in the board

   # ask for player_one's choice again if position has been taken

   # fill the cell in the board with player_one_symbol according to position player_one chose

   # update the board

   # print the updated board

   # ask for player_two's choice

   # player two gives choice

   # ask for player_two's choice again if position has been taken

   # fill the cell in the board with player_one_symbol according to position player_one chose

   # update the board

   # print the updated board
# end of the loop

# if there is a winner, print message to congratulate the winner

# else if there is a draw, print a draw message
