class NHLStats::List
  attr_reader :list

  HEADING = <<-HEAD
  *********************************************************************************************************************
                                   Games   Goals                 Penalty     P.P.  S.H.  G.W.   Gls/   Ass./  Pts/
      Name               Born Pos. Played  Scored Assists Points Mins   +/-  Gls   Gls   Gls    GPlyd  GPlyd  GPlyd
*********************************************************************************************************************
    HEAD
  FOOTER = <<-FOOT
  *********************************************************************************************************************
          Name           Born Pos  Games   Goals  Assists Points Penalty     P.P.  S.H.  G.W.   Gls/   Ass./  Pts/
                                   Played  Scored                Mins   +/-  Gls   Gls   Gls    GPlyd  GPlyd  GPlyd
  *********************************************************************************************************************
      FOOT

    def initialize
      @list = NHLPlayers::Player.all
    end

    def self.list_player(player)
      puts HEADING
      puts player
    end

    def self.list_players(players)
      puts HEADING
      players.each{ |player|
        player.display
      }
      puts FOOTER
    end

    def sort_by_goals_scored
      @list.sort_by!{ |player|
        -player.goals_scored.strip.to_i
       }
      @list.each_with_index{ |e, i|
        e.rank = i + 1
      }
    end

end
