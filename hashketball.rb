# Write your code here!
require "pry"

def game_hash
  teams_hash = {
    :home => {
      :team_name => "Brooklyn Nets", # a string of the team name
      :colors => ["Black", "White"], # an array of strings of team's colors
      :players => # player's stats
        [
          { :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          { :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          { :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          { :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          { :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets", # a string of the team name
      :colors => ["Turquoise", "Purple"], # an array of strings of team's colors
      :players => # player's stats
        [
          { :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          { :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          { :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          { :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          { :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
        ]
    }
  }

  teams_hash
end

# def good_practices
#   game_hash.each do |location, team_data|
  
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
  
#     team_data.each do |name, data|
  
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
 
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       team_playersdata.each do ||
#           binding.pry
#       end
#     end
#   end
# end

# good_practices

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |stats| # array of hashes
      if stats.has_value?(name) # check each hash for value
        return stats[:points] # if name value exists, return points
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |stats| # array of hashes
      if stats.has_value?(name)
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  team_names_array = []
  game_hash.each do |location, team_data|
    team_names_array.push(team_data[:team_name])
  end
  team_names_array
end

def player_numbers(team_name)
  team_numbers_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |stats|
        team_numbers_array.push(stats[:number])
      end
    end
  end
  team_numbers_array
end

def player_stats(name)
  player_stats = Hash.new()
  game_hash.each do |location, team_data|
    team_data[:players].each do |stats|
      if stats.has_value?(name)
        stats.each do |attribute, value|
          player_stats[attribute] = value
          player_stats.keep_if { |attribute, value| attribute != :player_name }
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  largest_shoe_size = 0
  player_shoes_rebounds = Hash.new
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |stats|
      stats.each do |attribute, value| # inside players hashes
        if attribute == :shoe && value > largest_shoe_size
          largest_shoe_size = value
          player_shoes_rebounds[:player_name] = stats[:player_name]
          player_shoes_rebounds[:rebounds] = stats[:rebounds]
        end
      end
    end
  end
  player_big_shoe_rebounds = player_shoes_rebounds[:rebounds]
end

def most_points_scored
  most_points = 0
  player_most_points = Hash.new
  
   game_hash.each do |location, team_data|
    team_data[:players].each do |stats|
      stats.each do |attribute, value| # inside players hashes
        if attribute == :points && value > most_points
          most_points = value
          player_most_points[:player_name] = stats[:player_name]
          player_most_points[:points] = stats[:points]
        end
      end
    end
  end
  player_most_points[:player_name]
end

def winning_team
  team_most_points = Hash.new
  
   game_hash.each do |location, team_data|
    team_points = 0
    team_data[:players].each do |stats|
      stats.each do |attribute, value| # inside players hashes
        if attribute == :points
          team_points += value
        end
        team_most_points[team_data[:team_name]] = team_points
      end
    end
  end
  
  team_points_array = team_most_points.sort_by { |team, points| -points}
  team_points_array[0][0]
end

def player_with_longest_name
  most_chars = 0
  player_name = Hash.new
  
   game_hash.each do |location, team_data|
    team_data[:players].each do |stats|
      stats.each do |attribute, value| # inside players hashes
        if attribute == :player_name && value.length > most_chars
          most_chars = value.length
          player_name[:player_name] = stats[:player_name]
          player_name[:name_length] = value.length
        end
      end
    end
  end
  player_name[:player_name]
end

def long_name_steals_a_ton?
  most_chars = 0
  most_steals = 0
  player_name = Hash.new
  player_steals = Hash.new
  
   game_hash.each do |location, team_data|
    team_data[:players].each do |stats|
      stats.each do |attribute, value| # inside players hashes
        if attribute == :player_name && value.length > most_chars
          most_chars = value.length
          player_name[:player_name] = stats[:player_name]
          player_name[:name_length] = value.length
          player_name[:steals] = stats[:steals]
        end
        if attribute == :steals && value > most_steals
          most_steals = value
          player_steals[:player_name] = stats[:player_name]
          player_steals[:steals] = stats[:steals]
        end
      end
    end
  end
  return player_name[:player_name] == player_steals[:player_name]
end