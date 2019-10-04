# Write your code here!

def game_hash

  game_hash = {

    home: {

      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [

        {"Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 
          }
        },

        {"Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          }
        },

        {"Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
          }
        },

        {"Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
          }
        },

        {"Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
          }
        }

      ]

    },

    away: {

      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [

        {"Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
          }
        },

        {"Bismack Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
          }
        },

        {"DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
          }
        },

        {"Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
          }
        },

        {"Kemba Walker": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
          }  
        }
      ]
    }
  }
  return game_hash
end

def num_points_scored(player_name)
  game_hash.each { |location, team_info| team_info[:players].each { |player, player_info|

      if player.keys[0].to_s.eql? player_name
        return player.values[0][:points]
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each { |location, team_info| team_info[:players].each {|player, player_info| 
    
    if player.keys[0].to_s.eql? player_name
      return player.values[0][:shoe]
    end
    } 
  }
end

def team_colors(team_name)
  game_hash.each {|location, team_info|
   
   if team_info[:team_name].eql? team_name
     return team_info[:colors]
    end
  }
end

def team_names()
  teamarray = []
  game_hash.each {|location, team_info|
    teamarray.push(team_info[:team_name])
  }
  return teamarray
end

def player_numbers(team_name)
  teamnumbers = []
  game_hash.each {|location, team_info| 
    if team_info[:team_name] == team_name 
      team_info[:players].each {|player, player_info|
        teamnumbers.push(player.values[0][:number])
    }
  end
  }
  return teamnumbers
end

def player_stats(player_name)
  game_hash.each {|location, team_info| team_info[:players].each {|player, player_info| 
    if player.keys[0].to_s == player_name
      return player.values[0]
    end
    }
  }
end 

def big_shoe_rebounds
  largest_size = 0
  game_hash.each { |location, team_info| team_info[:players].each { |player, player_info|

      if player.values[0][:shoe] > largest_size
        largest_size = player.values[0][:shoe]
      end
    }
    team_info[:players].each { |player, player_info|

      if player.values[0][:shoe] == largest_size
        return player.values[0][:rebounds]
      end
    }
  }
end

#Bonus

def most_points_scored
 most_points = 0
  player_location = []
  game_hash.each { |location, team_info| team_info[:players].each { |player, player_info|

      if player.values[0][:points] > most_points
        most_points = player.values[0][:points]
        player_location = location
      end
    }
  }

  game_hash[player_location][:players].each {|player, player_info|

    if player.values[0][:points] == most_points
      return player.keys[0].to_s
    end
  }
end

def winning_team
  winning_team = {}
  game_hash.each {|location, team_info| winning_team[team_info[:team_name].to_sym] = 0
    team_info[:players].each { |player, player_info|
      winning_team[team_info[:team_name].to_sym] += player.values[0][:points]
    }
  }
  return winning_team.max_by {|key, value| value }[0].to_s
end 

def player_with_longest_name
  player_name_length = 0
  player_name = ""
  game_hash.each { |location, team_info| team_info[:players].each { |player, player_info|
      if player.keys[0].to_s.length > player_name_length
        player_name_length = player.keys[0].to_s.length
        player_name = player.keys[0].to_s
      end
    }
  }
  return player_name
end

def long_name_steals_a_ton?
  player_name = player_with_longest_name().to_sym
  stealing = false
  game_hash.each { |location, team_info| team_info[:players].each { |player, player_info|
      if player.keys[0] == player_name && player.values[0][:steals] > 10
        stealing = true
      end
    }
  }
  return stealing
end






