class NhlStats::CLI
  @player_list = []

  def call
    list_top_players
    menu
  end

  def list_top_players


    #save to @player_list
    @player_list = NhlStats::Player.all
  end

def menu
  puts "Enter number to get more info on player, or type 'exit' to leave. Type -h for help."
  input = gets.strip

  if input == 'exit'
    puts "Goodbye!"
    exit
  elsif input == "-h"
    puts "Insert helpful information here!!"
  elsif input.to_i > 0 && input.to_i <= 50
    # Get info on corresponding player in @player_list
    puts "Player information for list number: #{input}"
  else
    puts "I don't understand!"
    sleep 1
    menu
  end
end

def display_player(number)
  puts "Player info from player #{number} in #{@player_list[number - 1]}"
end



end
