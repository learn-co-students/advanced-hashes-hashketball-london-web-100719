require "pry"

def game_hash 
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end 

def num_points_scored(players_name)
  hash = game_hash 
  hash.each do |h_a, h_a_hash|
    h_a_hash.each do |section, section_stuff|
      if section_stuff.include?(players_name)
        return hash[h_a][section][players_name][:points]
      end 
    end 
  end 
end

def shoe_size(players_name)
  hash = game_hash
  hash.each do |h_a, h_a_hash|
    h_a_hash.each do |section, section_stuff|
      if section_stuff.include?(players_name)
        return hash[h_a][section][players_name][:shoe]
      end 
    end 
  end 
end

def team_colors(name_of_team)
  hash = game_hash
  hash.each do |h_a, h_a_hash|
    h_a_hash.each do |section, section_stuff|
      if section_stuff.include?(name_of_team)
        return hash[h_a][:colors]
      end 
    end 
  end 
end 

def team_names
  hash = game_hash
  teams = []
  teams.push(hash[:home][:team_name])
  teams.push(hash[:away][:team_name])
  return teams
end 

def player_numbers(team_name)
  hash = game_hash
  new_array = []
  if hash[:home][:team_name] === team_name
    hash[:home][:players].each do |player, stats|
      new_array << hash[:home][:players][player][:number]
    end 
  end 
  if hash[:away][:team_name] === team_name
    hash[:away][:players].each do |player, stats|
      new_array << hash[:away][:players][player][:number]
    end 
  end 
  return new_array
end 

def player_stats(players_name)
  hash = game_hash
  hash.each do |h_a, h_a_hash|
    h_a_hash.each do |section, section_stuff|
      if section_stuff.include?(players_name)
        return hash[h_a][section][players_name]
      end 
    end 
  end 
end 

def big_shoe_rebounds
  hash = game_hash
  home_shoe_array = []
  hash[:home][:players].each do |player, stats|
    home_shoe_array << hash[:home][:players][player][:shoe]
  end 
  home_sorted = home_shoe_array.sort
  highest_size_home = home_sorted[4]
  hash[:home][:players].each do |player, stats|
    if hash[:home][:players][player][:shoe] === highest_size_home
      $biggest_home = player
    end 
  end 
  away_shoe_array = []
  hash[:away][:players].each do |player, stats|
    away_shoe_array << hash[:away][:players][player][:shoe]
  end 
  away_sorted = away_shoe_array.sort
  highest_size_away = away_sorted[4]
  hash[:away][:players].each do |player, stats|
    if hash[:away][:players][player][:shoe] === highest_size_away
      $biggest_away = player
    end 
  end 
  if $biggest_home > $biggest_away
    return hash[:home][:players][$biggest_home][:rebounds]
  else 
    return hash[:away][:players][$biggest_away][:rebounds]
  end 
end 

def most_points_scored 
  hash = game_hash
  $pointsvar = 0 
  hash.each do |h_a, h_a_hash|
    hash[h_a][:players].each do |player, stats|
      if hash[h_a][:players][player][:points] > $pointsvar
        $pointsvar = hash[h_a][:players][player][:points]
      end 
    end 
  end 
  hash.each do |h_a, h_a_hash|
    hash[h_a][:players].each do |player, stats|
      if stats[:points] === $pointsvar
        return player
      end 
    end 
  end 
end 

def winning_team
  hash = game_hash
  home_points = 0 
  away_points = 0 
  hash[:home][:players].each do |player, stat|
    home_points += stat[:points]
  end 
  hash[:away][:players].each do |player, stat|
    away_points += stat[:points]
  end 
  if away_points > home_points
    return hash[:away][:team_name]
  else 
    return hash[:home][:team_name]
  end 
end 

def player_with_longest_name
  hash = game_hash
  name_length = 0
  hash.each do |h_a, h_a_array|
    hash[h_a][:players].each do |player, stats|
      if player.length > name_length
        name_length = player.length
        $name_player = player
      end 
    end 
  end 
  return $name_player
end

def most_steals_scored 
  hash = game_hash
  $stealsvar = 0 
  hash.each do |h_a, h_a_hash|
    hash[h_a][:players].each do |player, stats|
      if hash[h_a][:players][player][:steals] > $stealsvar
        $stealsvar = hash[h_a][:players][player][:steals]
      end 
    end 
  end 
  hash.each do |h_a, h_a_hash|
    hash[h_a][:players].each do |player, stats|
      if stats[:steals] === $stealsvar
        return player
      end 
    end 
  end 
end

def long_name_steals_a_ton?
  longestName = player_with_longest_name
  mostSteals = most_steals_scored
  if longestName === mostSteals
    return true 
  else 
    return false 
  end 
end 



  