require_relative "../lib/nhl_stats/version"
require_relative "../lib/nhl_stats/cli"
require_relative "../lib/nhl_stats/player"
require_relative "../lib/nhl_stats/scraper"

class NHLStats::CLI

  def call
     NHLStats::Scraper.scrape_top_players
     NHLStats::Player.display_all
     NHLStats::Player.all
    menu
  end

  def menu
    puts "Enter number to get more info on player, or type 'exit' to leave."
    puts "Type 'list' to list all players."
    input = gets.strip

    if input == 'exit'
      puts "Goodbye!"
      exit
    elsif input == "list"
      NHLStats::Player.display_all
      menu
    elsif input == "sort"
      NHLStats::Player.sort_by_goals_scored
      menu
    elsif input.to_i <= NHLStats::Player.all.length && !input.empty?
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
    x = NHLStats::Player.all[num - 1]
    NHLStats::Scraper.scrape_player(x)
    x.display_bio
  end

end
