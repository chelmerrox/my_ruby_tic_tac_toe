#!/usr/bin/env ruby
puts 'Hello world!'
#--------Method definitions--------------
  #define ask_for_name_repeatedly method which is to repetitively ask the player's
  #to give a name if they do not give a name
  def ask_for_name_repeatedly(player_one_name)
   while player_one_name = ''
     puts 'Please enter your name: '
     player_one_name = gets.chomp
   end
   player_one_name
  end

  #define ask_for_symbol_repeatedly method which is to repetitively ask player_one to 
  #choose & enter the symbol he/she wants to use
  def ask_for_symbol_repeatedly(player_one_symbol)
    while player_one_symbol != 'X' || player_one_symbol != 'O'
      puts 'Please enter either X or O as your symbol:'
      player_one_symbol = gets.chomp
    end
    player_one_symbol
  end

  #define ask_for_different_name method which is to repetitively ask player_two 
  #to give a different name if it's the same as player_one's name

#----------------------------------------



#-------Class and Module definitions------
  #define a class

#-----------------------------------------


# print a welcome message for this tic-tac-toe game
puts "~~~~                               ~~~~"
puts "    WELCOME TO MY TIC-TAC-TOE GAME!    "
puts "~~~~                               ~~~~"

# Ask for player_ones's name
puts "Please enter your name, player one: "
# player_one gives his/her name
player_one_name = gets.chomp

# if player_one doesn't give a name, then call the ask_for_name_repeatedly method
ask_for_name_repeatedly(player_one_name) if player_one_name = ''

# ask player_one which symbol he/she wishes to use: symbol_one = 'X' or symbol_two = 'O'
puts "Alright! Now, #{player_one_name}, please type in which symbol you want to use. 'X' or 'O':"
player_one_symbol = gets.chomp

# if player_one doesn't give 'X' or 'O', the call ask_for_symbol_repeatedly method
ask_for_symbol_repeatedly(player_one_symbol) if player_one_symbol != 'X' || player_one_symbol != 'O'

# based on player_one's answer above, assign the symbol to player_one and 
# the opposite to player_two

# Ask for player_two's name
# player_two gives his/her name

# if player_two doesn't give a name, then call the ask_for_name_repeatedly method

# if player_two's name is the same as player_one's, then call the ask_for_different_name method

# 

# 
