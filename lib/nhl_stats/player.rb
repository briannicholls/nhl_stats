class NhlStats::Player
  # base player url (gretzky): https://www.quanthockey.com   /hockey-stats/en/profile.php?player=2143
  @@all = []

  def initialize(params)
    params.each{ |key, value| self.send("#{key}=", value) }
    self.standardize
  end

  attr_accessor :url, :rank, :country, :name, :born, :position, :games_played, :goals_scored, :assists,
    :points, :penalty_minutes, :plus_minus, :pplay_goals, :shorthanded_goals, :game_winning_goals,
    :goals_per_games_played, :assists_per_games_played, :points_per_games_played, :bio

  def self.display_all
    # return all players
    puts "All-Time Points Leaders:"
    puts <<-list
                                   Games   Goals                 Penalty     P.P.  S.H.  G.W.   Gls/   Ass./  Pts/
      Country/Name       Born Pos. Played  Scored Assists Points Mins   +/-  Gls   Gls   Gls    GPlyd  GPlyd  GPlyd
    list

    @@all.each_with_index{ |e, i|
    puts <<-rows
#{e.rank} #{e.country} #{e.name} #{e.born} #{e.position}    #{e.games_played}   #{e.goals_scored}    #{e.assists}    #{e.points}   #{e.penalty_minutes}   #{e.plus_minus}  #{e.pplay_goals}   #{e.shorthanded_goals}    #{e.game_winning_goals}    #{e.goals_per_games_played}  #{e.assists_per_games_played}  #{e.points_per_games_played}
    rows
    }
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def standardize
    self.rank = " #{self.rank}" if self.rank.length < 2
    self.country = "  " if self.country.length < 2
    #7

    x = 18 - self.name.length
    x.times do
      self.name = " #{self.name}"
    end

    x = 4 - self.goals_scored.length
    x.times do
      self.goals_scored = " #{self.goals_scored}"
    end

    x = 4 - self.games_played.length
    x.times do
      self.games_played = " #{self.games_played}"
    end

    x = 4 - self.assists.length
    x.times do
      self.assists = " #{self.assists}"
    end

    x = 4 - self.penalty_minutes.length
    x.times do
      self.penalty_minutes = " #{self.penalty_minutes}"
    end

    x = 3 - self.plus_minus.length
    x.times do
      self.plus_minus = " #{self.plus_minus}"
    end

    x = 2 - self.shorthanded_goals.length
    x.times do
      self.shorthanded_goals = " #{self.shorthanded_goals}"
    end

    x = 3 - self.game_winning_goals.length
    x.times do
      self.game_winning_goals = " #{self.game_winning_goals}"
    end

    x = 3 - self.pplay_goals.length
    x.times do
      self.pplay_goals = " #{self.pplay_goals}"
    end

  end

  def display_bio
    puts self.bio
  end
end
