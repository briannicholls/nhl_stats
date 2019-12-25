class NHLStats::CLI

  def call
     NHLStats::Scraper.scrape_top_players
     @top_players = NHLStats::List.new
     @top_players.list_players
    menu
  end

  def menu

    puts "Enter number to get more info on player, or type 'exit' to leave."
    puts "Type 'list' to list all players, or 'sort' to sort by goals scored."
    input = gets.strip

    if input == 'exit'
      puts "Goodbye!"
      exit
    elsif input == "list"
      @top_players.list_players
    elsif input == "sort"
      @top_players.sort_by_goals_scored
      @top_players.list_players
    elsif input.to_i <= NHLStats::Player.all.length && !input.empty?
      add_bio(input.to_i)
      puts NHLStats::Player.all[input.to_i - 1].bio
    else
      puts "I don't understand!"
      sleep 0.7
    end
    menu
  end

  def add_bio(num)
    x = NHLStats::Player.all[num - 1]
    NHLStats::Scraper.scrape_player(x)
  end

end
