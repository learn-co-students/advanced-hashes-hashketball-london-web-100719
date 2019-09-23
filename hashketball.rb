# Write your code here!

require "pry"

def game_hash
  
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Kemba Walker" => {
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
    }
  }
end 


def num_points_scored(player_name)
  game_hash.each do |home_or_away, team_data|
    if team_data[:players].include?(player_name)
      return team_data[:players][player_name][:points]
    end
  end
  nil
end

def shoe_size(player_name)
  game_hash.each do |home_or_away, team_data|
    if team_data[:players].include?(player_name)
      return team_data[:players][player_name][:shoe]
    end
  end
  nil
end

def team_colors(team_name)
  game_hash.each do |home_or_away, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end 
  end
  nil
end 

def team_names
  team_names_array = []
  game_hash.each do |home_or_away, team_data|
    team_names_array.push(team_data[:team_name])
  end 
  return team_names_array
end 

def player_numbers(team_name)
  jersey_numbers_array = []
  game_hash.each do |home_or_away, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player_name, player_data|
        jersey_numbers_array.push(player_data[:number])
      end
    end 
  end
  return jersey_numbers_array
end

def player_stats(player_name)
  game_hash.each do |home_or_away, team_data|
    if team_data[:players].include?(player_name)
      return team_data[:players][player_name]
    end
  end
  nil
end

def big_shoe_rebounds
  biggest_shoe_player = ""
  biggest_shoe_size = 0
  num_rebounds = 0
  
  game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:shoe] > biggest_shoe_size
        biggest_shoe_player = player_name
        biggest_shoe_size = player_data[:shoe]
        num_rebounds = player_data[:rebounds]
      end
    end 
  end
  return num_rebounds
end 

def most_points_scored
  highest_scoring_player = ""
  highest_individual_score = 0 
  
  game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:points] > highest_individual_score
        highest_scoring_player = player_name
        highest_individual_score = player_data[:points]
      end
    end  
  end 
  return highest_scoring_player
end 

def winning_team
  highest_team_name = ""
  highest_team_score = 0

  game_hash.each do |home_or_away, team_data|
    current_team_name = team_data[:team_name]
    current_team_score = 0
    
    team_data[:players].each do |player_name, player_data|
      current_team_score += player_data[:points]
    end 
    
    if current_team_score > highest_team_score
      highest_team_score = current_team_score
      highest_team_name = current_team_name
    end

  end 
  return highest_team_name
end 

def player_with_longest_name
  
  longest_name = ""
  longest_name_length = 0 
  
  game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name.length > longest_name_length
        longest_name = player_name
        longest_name_length = player_name.length
      end 
    end 
  end 
  return longest_name
end 

def long_name_steals_a_ton?
  longest_name_player = player_with_longest_name
  most_steals_player = most_steals_scored
  longest_name_player == most_steals_scored ? true : false
end

def most_steals_scored
  highest_steals_player = ""
  highest_individual_steals = 0 
  
  game_hash.each do |home_or_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:steals] > highest_individual_steals
        highest_steals_player = player_name
        highest_individual_steals = player_data[:steals]
      end
    end  
  end 
  return highest_steals_player
end 