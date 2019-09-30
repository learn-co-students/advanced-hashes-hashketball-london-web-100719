require "pry"

def game_hash

  new_hash = {

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

        }},

        {"Reggie Evans": {

          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7

        }},

        {"Brook Lopez": {

          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15

        }},

        {"Mason Plumlee": {

          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5

        }},

        {"Jason Terry": {

          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1

        }}

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

        }},

        {"Bismack Biyombo": {

          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10

        }},

        {"DeSagna Diop": {

          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5

        }},

        {"Ben Gordon": {

          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0

        }},

        {"Kemba Walker": {

          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12

        }}

      ]

    }

  }

  return new_hash

end

def num_points_scored(name)

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if player.keys[0].to_s == name

        return player.values[0][:points]

      end

    end

  end

end

def shoe_size(name)

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if player.keys[0].to_s == name

        return player.values[0][:shoe]

      end

    end

  end

end

def shoe_size(name)

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if player.keys[0].to_s == name

        return player.values[0][:shoe]

      end

    end

  end

end

def team_colors(name)

  game_hash.each do |location, team_data|

    if name == team_data[:team_name]

      return team_data[:colors]

    end

  end

end

def team_names

  new_arr = []

  game_hash.each do |location, team_data|

    new_arr << team_data[:team_name]

  end

  return new_arr

end

def player_numbers(name)

  new_arr = []

  game_hash.each do |location, team_data|

    if name == team_data[:team_name]

      team_data[:players].each do |player, player_data|

        new_arr << player.values[0][:number]

      end

    end

  end

  return new_arr

end

def player_stats(name)

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if name == player.keys[0].to_s

        return player.values[0]

      end

    end

  end

end

def big_shoe_rebounds

  biggest_shoe_size = 0

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|


      if player.values[0][:shoe] > biggest_shoe_size

        biggest_shoe_size = player.values[0][:shoe]

      end

    end

    team_data[:players].each do |player, player_data|


      if player.values[0][:shoe] == biggest_shoe_size

        return player.values[0][:rebounds]

      end

    end

  end

end
#binding.pry
def most_points_scored

  most_points = 0
  player_location = []

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if player.values[0][:points] > most_points

        most_points = player.values[0][:points]
        player_location = location

      end

    end

  end

  game_hash[player_location][:players].each do |player, player_data|

    if player.values[0][:points] == most_points

      return player.keys[0].to_s

    end

  end

end

def winning_team

  new_hash = {}

  game_hash.each do |location, team_data|

    new_hash[team_data[:team_name].to_sym] = 0

    team_data[:players].each do |player, player_data|

      new_hash[team_data[:team_name].to_sym] += player.values[0][:points]

    end

  end

  return new_hash.max_by { |key, value| value }[0].to_s

end

def player_with_longest_name

  name_length = 0
  name = ""

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if player.keys[0].to_s.length > name_length

        name_length = player.keys[0].to_s.length
        name = player.keys[0].to_s

      end

    end

  end

  return name

end

def long_name_steals_a_ton?

  name = player_with_longest_name().to_sym

  stealing = false

  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_data|

      if player.keys[0] == name && player.values[0][:steals] > 10

        stealing = true

      end

    end

  end

  return stealing

end
