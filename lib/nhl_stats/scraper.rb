class NHLStats::Scraper
  BASE = "https://www.quanthockey.com"
  URL = "https://www.quanthockey.com/NHL/records/NHL-players-all-time-points-leaders.html"

  # scrape data from all-time top players and create Player object for each
  def self.scrape_top_players
    doc = Nokogiri::HTML(open(URL))
    all_rows = doc.css('tbody tr')

    players = all_rows.map{ |row|
      values = row.css('td')
      NHLStats::Player.new(
        url: values[2].children[0]["href"],
        rank: values[0].text,
        country: values[1].text,
        name: values[2].text,
        born: values[3].text,
        position: values[4].text,
        games_played: values[5].text,
        goals_scored: values[6].text,
        assists: values[7].text,
        points: values[8].text,
        penalty_minutes: values[9].text,
        plus_minus: values[10].text,
        pplay_goals: values[11].text,
        shorthanded_goals: values[12].text,
        game_winning_goals: values[13].text,
        goals_per_games_played: values[14].text,
        assists_per_games_played: values[15].text,
        points_per_games_played: values[16].text
      ).save
     }
  end

  #input Player to scrape more information and save to Player object
  def self.scrape_player(player)
    doc = Nokogiri::HTML(open("#{BASE}#{player.url}"))

    x = doc.css('#profile *') #.text
    bio = x[1].children.collect{|e| e.text}.select{|e| !e.empty?}
    player.bio = <<-bio
    ************************************************
    *  #{player.name}
    *  #{bio[0]} #{bio[1]}
    *  #{bio[2]} #{bio[3]}
    *  #{bio[4]}
    *  #{bio[5]}
    *  #{bio[6]}
    ************************************************
    bio
  end

end
