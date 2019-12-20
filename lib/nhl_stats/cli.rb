class NhlStats::CLI
  @player_list = []

  def call
     NhlStats::Scraper.scrape_top_players
     NhlStats::Player.display_all

     @player_list = NhlStats::Player.all
    menu
  end


  def menu
    puts "Enter number to get more info on player, or type 'exit' to leave."
    puts "Type 'list' to list all players. Type -h for help."
    input = gets.strip

    if input == 'exit'
      puts "Goodbye!"
      exit
    elsif input == "list"
      NhlStats::Player.display_all
      menu
    elsif input == "-h"
      puts "Insert helpful information here!!"
    elsif input.to_i <= @player_list.length
      display_player(input.to_i)
      puts "Press any key to continue..."
      gets.strip
      menu
    else
      puts "I don't understand!"
      sleep 0.7
      menu
    end
  end


  def display_player(num)
    x = @player_list[num - 1]
    NhlStats::Scraper.scrape_player(x)
    x.display_bio
  end



end
