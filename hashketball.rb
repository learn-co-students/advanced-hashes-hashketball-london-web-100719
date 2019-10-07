require "pry"

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"],
      players: [
        {name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        {name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {name:"Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {name:"Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {name:"Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        
      ] 
    },
    away: {
      team_name: "Charlotte Hornets" , 
      colors: ["Turquoise", "Purple"],
      players: [
        {name:"Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        {name:"Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {name:"DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {name:"Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {name:"Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ] 
    }
  }
end

def num_points_scored(player_name)
  
  game_hash.each do |team,information|
   
    information[:players].each do |element|
      
      if element[:name] == player_name
        return element[:points]
      end
      
    end
  end
  
end

def shoe_size(player_name)
  
  game_hash.each do |team,information|
   
    information[:players].each do |element|
      
      if element[:name] == player_name
        return element[:shoe]
        
      end
      
    end
  end
  
end

def team_colors(team_name)
  
  game_hash.each do |team, information|
    if information[:team_name] == team_name
      return information[:colors]
    end
  end
    
end 

def team_names
  new_array = []
  game_hash.each do |team,information|
  new_array << information[:team_name]
end
new_array
end 

def player_numbers(team_name)
  new_array = []
  game_hash.each do |team,information|
    if information[:team_name] == team_name
    information[:players].each do |element|
      new_array << element[:number]
    end
    return new_array
    end
  end
end 

def player_stats(player_name)
  new_hash = {}
  
  game_hash.each do |team,information|
   
    information[:players].each do |element|
      
      if element[:name] == player_name
        element.each do |stats ,value|
         new_hash[stats] = value
         
        end
      new_hash.delete(:name)
 
      return new_hash
        
      end
      
    end
  end
end

def big_shoe_rebounds
  stats = [0]
  
  game_hash.each do |team,information|
    information[:players].each do |element|

     if element[:shoe] > stats[0]
       stats[0] = element[:shoe]
       stats[1] = element[:rebounds]
     end

    end
    return stats[1]
  end
end 

def most_points_scored
  stats = [0]
  
  game_hash.each do |team,information|
    information[:players].each do |element|
      
      if element[:points] > stats[0]
        stats[0] = element[:points]
        stats[1] = element[:name]
      end
    end
  end
  stats[1]
end 

def winning_team
  team1 = 0
  team2 = 0
  
  game_hash.each do |team,information|
    information[:players].each do |element|
      if information[:team_name] = "Brooklyn Nets"
        team1 = team1 + element[:points]
      else 
        team2 = team2 + element[:points]
      end
    end
  end
  if team1 > team2
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end 

def player_with_longest_name
  name_length = [0]
  
  game_hash.each do |team,information|
    information[:players].each do |element|
      length = element[:name].length
      
      if element[:name].length > name_length[0]
        name_length[0] = element[:name].length
        name_length[1] = element[:name]
      end
      
    end
  end
  name_length[1]
end 

def long_name_steals_a_ton?
  stats = [0]
  
  game_hash.each do |team,information|
    information[:players].each do |element|
      
      if element[:steals] > stats[0]
        stats[0] = element[:steals]
        stats[1] = element[:name]
      end
    end
  end
  stats[1] == player_with_longest_name
end 
