def game_hash()
  return {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors   => ["Black", "White"],
      :players  => {
        "Alan Anderson" => {
          :number    => 0,
          :shoe      => 16,
          :points    => 22,
          :rebounds  => 12,
          :assists   => 12,
          :steals    => 3,
          :blocks    => 1,
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number    => 30,
          :shoe     => 14,
          :points    => 12,
          :rebounds  => 12,
          :assists   => 12,
          :steals    => 12,
          :blocks    => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez"  => {
          :number    => 11,
          :shoe     => 17,
          :points    => 17,
          :rebounds  => 19,
          :assists   => 10,
          :steals    => 3,
          :blocks    => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number    => 1,
          :shoe     => 19,
          :points    => 26,
          :rebounds  => 11,
          :assists   => 6,
          :steals    => 3,
          :blocks    => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number    => 31,
          :shoe     => 15,
          :points    => 19,
          :rebounds  => 2,
          :assists   => 2,
          :steals    => 4,
          :blocks    => 11,
          :slam_dunks => 1,
        },
      },
    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors   => ["Turquoise", "Purple"],
      :players  => {

        "Jeff Adrien" => {
          :number    => 4,
          :shoe     => 18,
          :points    => 10,
          :rebounds  => 1,
          :assists   => 1,
          :steals    => 2,
          :blocks    => 7,
          :slam_dunks => 2,
        },
         "Bismack Biyombo" => {
          :number    => 0,
          :shoe     => 16,
          :points    => 12,
          :rebounds  => 4,
          :assists   => 7,
          :steals    => 22,
          :blocks    => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number    => 2,
          :shoe     => 14,
          :points    => 24,
          :rebounds  => 12,
          :assists   => 12,
          :steals    => 4,
          :blocks    => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number    => 8,
          :shoe     => 15,
          :points    => 33,
          :rebounds  => 3,
          :assists   => 2,
          :steals    => 1,
          :blocks    => 1,
          :slam_dunks => 0,
        },
        "Kemba Walker" => {
          :number    => 33,
          :shoe     => 15,
          :points    => 6,
          :rebounds  => 12,
          :assists   => 12,
          :steals    => 7,
          :blocks    => 5,
          :slam_dunks => 12,
        },
      },
    }
  }
end

def find_player_by_name(name)
  if game_hash()[:home][:players][name]
    return game_hash()[:home][:players][name]
  end
  if game_hash()[:away][:players][name]
    return game_hash()[:away][:players][name]
  end
end


def num_points_scored(name)
  player = find_player_by_name(name)
  return player[:points]
end

def shoe_size(name)
  player = find_player_by_name(name)
  return player[:shoe]
end


def find_team_by_name(team_name)
  if game_hash()[:home][:team_name] == team_name
    return game_hash()[:home]
  end
  if game_hash()[:away][:team_name] == team_name
    return game_hash()[:away]
  end
end

def team_colors(team_name)
  team = find_team_by_name(team_name)
  return team[:colors]
end

def team_names()
  return [
   game_hash[:home][:team_name],
   game_hash[:away][:team_name],
  ]
end

def player_numbers(team_name)
  player_nums = []
  find_team_by_name(team_name)[:players].each {
   |k, v| player_nums << v[:number]
  }
  return player_nums
end

def player_stats(player_name)
  stats = {}
  find_player_by_name(name)
  return stats[:players]
end

def player_stats(player_name)
  return find_player_by_name(player_name)
end

def find_all_players()
  all_players = {}
  all_players = all_players.merge(game_hash()[:home][:players])
  all_players = all_players.merge(game_hash()[:away][:players])
  
  all_players_array = []
  all_players.each do |name,player|
    player[:name] = name
    all_players_array << player
  end
  return all_players_array
end

def big_shoe_player()
  biggest_seen_player = {:shoe => 0}
  find_all_players().each do |look_at_player|
    if look_at_player[:shoe] > biggest_seen_player[:shoe]
      biggest_seen_player = look_at_player
    end
  end
  return biggest_seen_player
end

def big_shoe_rebounds()
  return big_shoe_player()[:rebounds]
end 

def most_points_scored()
  most_points_seen_player = {:points => 0}
  find_all_players().each do |look_at_player|
    if look_at_player[:points] >= most_points_seen_player[:points]
      most_points_seen_player = look_at_player
    end 
  end 
  return most_points_seen_player[:name]
end 

def home_total_points()
  home_sum_array = []
  game_hash()[:home][:players].each do
    |name, attri| home_sum_array << attri[:points] 
  end 
  return  home_sum_array.sum 
end 

def away_total_points()
  away_sum_array = []
  game_hash()[:away][:players].each do
    |name, attri| away_sum_array << attri[:points] 
  end 
  return  away_sum_array.sum 
end 

def team_total_points(team)
  return team[:players].map{|n,p| p[:points]}.sum()
end

def winning_team()
  if home_total_points() < away_total_points()
    return game_hash()[:away][:team_name]
  else 
    return game_hash()[:home][:team_name]
  end 
end 


def player_with_longest_name()
  return find_all_players().map{|p| p[:name]}.sort_by {|n| n.length}.pop()
end 

def player_with_most_steals()
  find_all_players().sort_by{|p| p[:steals]}.pop()[:name]
end 

def long_name_steals_a_ton?()
  return (player_with_longest_name() == player_with_most_steals())
end 