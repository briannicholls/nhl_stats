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

    # initializes with all Players
    def initialize
      @list = NHLStats::Player.all
    end

    # input index number of player to list stats
    def list_player(number)
      player = self[number - 1]
      puts HEADING
      player.display
    end

    # list all players in List
    def list_players
      puts HEADING
      @list.each{ |player|
        player.display
      }
      puts FOOTER
    end

    # change sorting to goals scored
    def sort_by_goals_scored
      @list.sort_by!{ |player|
        -player.goals_scored.strip.to_i
       }
      @list.each_with_index{ |e, i|
        e.rank = (i + 1).to_s
      }
    end
end
