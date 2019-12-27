class NHLStats::CLI

  def call
    puts "********************************************"
    puts "* Fetching Player List , please wait...    *"
    puts "********************************************"
     @scraper = NHLStats::Scraper.new
     @scraper.scrape_top_players
     @top_players = NHLStats::List.new
     @top_players.list_players
    menu
  end

  def menu # MAIN MENU

    puts "Enter player's Rank number to get more info on that player."
    puts "Type 'list' to list all players, or 'sort' to change sorting method."
    puts "Type 'exit' to leave."
    input = gets.strip

    if input == 'exit'
      puts "Goodbye!"
      exit
    elsif input == "list"
      @top_players.list_players
    elsif input == "sort"
      sort_menu
    elsif input.to_i <= @top_players.length && input.to_i != 0
      player = @top_players.player(input.to_i)
      @scraper.scrape_player(player)
      player.display_bio
    else
      puts "I don't understand!"
      sleep 0.7
    end
    menu
  end

  def sort_menu # SORT-BY MENU
    puts "What would you like to sort by?"
    puts "0. Sort by Points (default)"
    puts "1. Sort by Birth Year"
    puts "2. Sort by Goals Scored"
    puts "3. Sort by Assists"
    puts "4. Sort by Games Played"
    puts "5. Sort by +/-"
    puts "6. Sort by Power Play Goals"
    puts "7. Sort by Short-Handed Goals"
    puts "8. Sort by Penalty Minutes"
    input = gets.strip
    # display list of sorting options
    case input
    when "0"
      @top_players.sort_by("shorthanded_goals")
    when "1"
      @top_players.sort_by("born")
    when "2"
      @top_players.sort_by("goals_scored")
    when "3"
      @top_players.sort_by("assists")
    when "4"
      @top_players.sort_by("games_played")
    when "5"
      @top_players.sort_by("plus_minus")
    when "6"
      @top_players.sort_by("pplay_goals")
    when "7"
      @top_players.sort_by("shorthanded_goals")
    when "8"
      @top_players.sort_by("penalty_minutes")
    end
    @top_players.list_players
    menu
  end

end
