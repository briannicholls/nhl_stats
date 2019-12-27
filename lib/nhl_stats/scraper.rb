class NHLStats::Scraper

  BASE = "https://www.quanthockey.com"
  URL = "https://www.quanthockey.com/NHL/records/NHL-players-all-time-points-leaders.html"
  URL_HASH = {
  }
  def initialize
    @doc = Nokogiri::HTML(open(URL))
  end

  # scrape data from all-time top players and create Player object for each
  def scrape_top_players

    @doc.css('tbody tr').each{ |row|
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
     if NHLStats::Player.all.length == 50
       next_page
       scrape_top_players
     end

  end

  # input: Player object, scrapes info from unique URL
  def scrape_player(player)
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

private
  def next_page
    browser = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
    browser.goto URL
    browser.link(text: "2").click
    sleep 2
    @doc = Nokogiri::HTML.parse(browser.html)
  end

end
