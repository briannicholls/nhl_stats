class NhlStats::Player
  # base player url (gretzky): https://www.quanthockey.com   /hockey-stats/en/profile.php?player=2143
  @all = []

  def initialize

    @@all << self
  end

  attr_accessor :url, :country, :name, :born, :position, :games_played, :goals_scored, :assists,
    :points, :penalty_minutes, :plus_minus, :pplay_goals, :shorthanded_goals, :game_winning_goals,
    :goals_per_games_played, :assists_per_games_played, :points_per_games_played

  def all
    # return all players
    puts "All-Time Points Leaders:"
    puts <<-list
                                 Games   Goals                 Penalty    P.P. S.H.G.W. Gls/  Ass./ Pts/
    Country/Name       Born Pos. Played  Scored Assists Points Mins   +/- Gls  Gls Gls  GPlyd GPlyd GPlyd
    1 CA Wayne Gretzky 1961 F    1487    894    1963    2857   577    520 204  73  91   0.601 1.320 1.921
    2 CZ Jaromír Jágr  1972 F    1733    766    1155    1921   1167   322 217  11  135  0.442 0.666 1.108
    list

    player = self.new
    player.url = "/hockey-stats/en/profile.php?player=2143" # from href attribute of name anchor element
    player.country = "CA"
    player.name = "Wayne Gretzky"
    player.born = "1961"
    player.position = "F"
    player.games_played = "1487"
    player.goals_scored = "894"
    player.assists = "1963"
    player.points = "2857"
    player.penalty_minutes = "577"
    player.plus_minus = "520"
    player.pplay_goals = "204"
    player.shorthanded_goals = "73"
    player.game_winning_goals = "91"
    player.goals_per_games_played = player.goals / player.games_played
    player.assists_per_games_played = player.assists / player.games_played
    player.points_per_games_played = player.points / player.games_played

  end

  def list_top_players
    
  end


end
