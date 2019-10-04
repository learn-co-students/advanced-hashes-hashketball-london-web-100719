require "pry"

def game_hash
  {
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
            ] },
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
            ] }
  }
end

def num_points_scored(name)
  
  game_hash.map do |side, stats|
    stats.map do | a, b |
      if a == :players
        b.map do |c|
          if c[:player_name] == name
            return c[:points]
          end
        end
      end
  end
  end
  
end

def shoe_size(name)
  
  game_hash.map do |side, stats|
    stats.map do | a, b |
      if a == :players
        b.map do |c|
          if c[:player_name] == name
            return c[:shoe]
          end
        end
      end
  end
  end
  
end

def team_colors(name)
  
  game_hash.map do |side, stats|
      #binding.pry
      if stats[:team_name] == name
       return stats[:colors]
      end
  end
  
end

def team_names
  
  new =[]
  game_hash.map do |side, stats|
    new.push(stats[:team_name])
  end
  new
end

def player_numbers(name)
  
  new =[]
  
  game_hash.map do |side, stats|
    if stats[:team_name] == name
      stats.map do |a, b|
        if a == :players
          b.map do |c|
            new.push(c[:number])
          end
        end
      end
    end
  end
  new
end

def player_stats(name)
  
  new =[]
  
  game_hash.map do |side, stats|
      stats.map do |a, b|
        if a == :players
          b.map do |c|
            if c[:player_name] == name
              new = c.delete_if do |d,e|
                d == :player_name
              end
            end
          end
        end
        end
      end
      
      new
      
    end
    
    
    
def big_shoe_rebounds
  
  biggest = 0
  rebounds = 0

  game_hash.map do |team, stats|
    
    stats[:players].map do |a|
      if a[:shoe] > biggest
        
        biggest = a[:shoe]
        rebounds = a[:rebounds]
        
      end
    end
  end

rebounds

end

def find_player(name, attrb)
  
  game_hash.map do |side, stats|
    stats[:players].map do |c|
      return c[attrb] if c[:player_name] == name
      
    end
  end
end


def find_player(name, attrb)
  game_hash.map do |side, stats|
    stats[:players].map do |c|
      return c[attrb] if c[:player_name] == name
    end
  end
end

def winning_team

  end_score = { 'Brooklyn Nets' => 0, 'Charlotte Hornets' => 0 }

  game_hash.map do |side, stats|
    stats[:players].each do |c|
    end_score[stats[:team_name]] += find_player(c[:player_name], :points)
    
    end
  end

end_score.max_by { |d, e| e }.first

end

def find_points(points)
  name = nil
  amount_of_points = 0

  game_hash.map do |side, stats|
    
    stats[:players].map do |c|
      
      if c[points].is_a? String
        
        if c[points].length > amount_of_points
          amount_of_points = c[points].length
          name = c[:player_name]
        end
        
      elsif c[points] > amount_of_points
        amount_of_points = c[points]
        name = c[:player_name]
        #binding.pry
      end
      
    end

  end

  name
end

def most_points_scored
  find_points(:points)
end

def player_with_longest_name
  find_points(:player_name)
end

def long_name_steals_a_ton?
  
  find_points(:steals) == find_points(:player_name)
    
 
end