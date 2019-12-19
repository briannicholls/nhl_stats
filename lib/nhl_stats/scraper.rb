class NhlStats::Scraper
  URL = "https://www.quanthockey.com/nhl/records/nhl-players-all-time-points-leaders.html"

  def self.scrape_player_stats

  end

  def self.scrape_all
    doc = Nokogiri::HTML(open(URL))

  end

end
