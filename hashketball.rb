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
  hash
end

def num_points_scored(player)
  game_hash = game_hash()
  if game_hash[:home][:players][player]
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  game_hash = game_hash()
  if game_hash[:home][:players][player]
    game_hash[:home][:players][player][:shoe]
  else
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team_name)
  game_hash = game_hash()
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  game_hash = game_hash()
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  game_hash = game_hash()
  jersey_nums = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each_pair {|player_name, player| jersey_nums.push(player[:number])}
  else
    game_hash[:away][:players].each_pair {|player_name, player| jersey_nums.push(player[:number])}
  end
  jersey_nums
end

def player_stats(player_name)
  game_hash = game_hash()
  if game_hash[:home][:players][player_name]
    game_hash[:home][:players][player_name]
  else
    game_hash[:away][:players][player_name]
  end
end

def big_shoe_rebounds
  game_hash = game_hash()
  all_players = game_hash[:home][:players].values + game_hash[:away][:players].values
  big_player = all_players.max_by {|player| player[:shoe]}
  return big_player[:rebounds]
end

def most_points_scored
  game_hash = game_hash()
  # [['john', { ... }], ['doe', { ... }]]
  all_players = game_hash[:home][:players].to_a + game_hash[:away][:players].to_a
  big_player = all_players.max_by {|player| player[1][:points]}
  return big_player[0]
end

def player_with_longest_name
  game_hash = game_hash()
  # [['john', { ... }], ['doe', { ... }]]
  all_players = game_hash[:home][:players].keys + game_hash[:away][:players].keys
  big_player = all_players.max_by {|name| name.length}
  return big_player
end

def winning_team
  game_hash = game_hash()
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each_pair {|name, player| home_score += player[:points]}
  game_hash[:away][:players].each_pair {|name, player| away_score += player[:points]}
  if home_score > away_score
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def long_name_steals_a_ton?
  game_hash = game_hash()
  # [['john', { ... }], ['doe', { ... }]]
  all_players = game_hash[:home][:players].to_a + game_hash[:away][:players].to_a
  big_player = all_players.max_by {|player| player[1][:steals]}

  longest_name_player = all_players.max_by {|player| player[0].length}

  if  longest_name_player[1][:steals] >= big_player[1][:steals]
    true
  else
    false
  end
end
