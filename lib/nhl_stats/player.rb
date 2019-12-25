class NHLStats::Player
  @@all = [] 

  attr_accessor :url, :rank, :country, :name, :born, :position, :games_played, :goals_scored, :assists,
    :points, :penalty_minutes, :plus_minus, :pplay_goals, :shorthanded_goals, :game_winning_goals,
    :goals_per_games_played, :assists_per_games_played, :points_per_games_played, :bio

  def initialize(params)
    params.each{ |key, value| self.send("#{key}=", value) }
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def display_bio
    puts @bio
  end

  def display
    puts <<-row
#{@rank.rjust(2)} #{@country.rjust(2)} #{@name.rjust(18)} #{@born}  #{@position}   #{@games_played.rjust(4)}   #{@goals_scored.rjust(4)}    #{@assists.rjust(4)}    #{@points}   #{@penalty_minutes.rjust(4)}   #{@plus_minus.rjust(3)}  #{@pplay_goals.rjust(3)}   #{@shorthanded_goals.rjust(2)}    #{@game_winning_goals.rjust(3)}    #{@goals_per_games_played}  #{@assists_per_games_played}  #{@points_per_games_played}
row
  end

end
