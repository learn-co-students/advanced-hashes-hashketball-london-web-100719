require "pry"

def game_hash
  {
    home: { team_name: 'Brooklyn Nets',
            colors: ["Black", "White"],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] },
    away: { team_name: 'Charlotte Hornets',
            colors: ["Turquoise", "Purple"],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] }
  }
end

def num_points_scored(name)
  player_score = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:player_name].include? (name)
        player_score = player_stats[:points]
        return player_score
      end  
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:player_name].include? (name)
        return player_stats[:shoe]
      end
    end
  end
end

def team_colors(team_name_arg)
  game_hash.each do |location, team_data|
    if team_data[:team_name].include? (team_name_arg)
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name_arg)
  player_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name].include? (team_name_arg)
      team_data[:players].each do |player_stats|
        player_numbers.push(player_stats[:number])
      end
    end
  end
  player_numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:player_name].include? (name)
        player_stats.delete(:player_name)
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_and_rebounds = [0,0]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:shoe] > biggest_shoe_and_rebounds[0]
        biggest_shoe_and_rebounds[0] = player_stats[:shoe]
        biggest_shoe_and_rebounds[1] = player_stats[:rebounds]
      end
    end
  end
  return biggest_shoe_and_rebounds[1]
end


=begin

Here's our spec for this lab:

hashketball
  #num_points_scored
    knows the number of points scored by each player (FAILED - 1)
  #shoe_size
    knows the shoe size of each player (FAILED - 2)
  #team_colors
    knows the Brooklyn Nets colors are Black and White (FAILED - 3)
  #team_names
    returns the team names (FAILED - 4)
  #player_numbers
    returns the player jersey numbers (FAILED - 5)
  #player_stats
    returns all stats for a given player (FAILED - 6)
  #big_shoe_rebounds
    returns the number of rebounds of the player with the biggest shoe size (FAILED - 7)

bonus
  #most_points_scored
    returns Ben Gordon (FAILED - 8)
  #winning_team
    returns the Brooklyn Nets (FAILED - 9)
  #player_with_longest_name
    returns Bismack Biyombo (FAILED - 10)

super bonus
  #long_name_steals_a_ton?
    returns true (FAILED - 11)
=end