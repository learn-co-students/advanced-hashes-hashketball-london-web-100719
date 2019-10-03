# Write your code here!
def game_hash
  output={};
  
  team_keys=      [:home, :away]
  toplevel_keys=  [:team_name,:colors,:players]

  team_keys.each do |teamkey|
    output[teamkey]={};
  end

  team_keys.each do |teamkey|
    
    toplevel_keys.each do |toplevelkey|
      output[teamkey][toplevelkey]={};
    end
    
  end
  
  player_keys=    [:number,:shoe,:points,:rebounds,:assists,:steals,:blocks,:slam_dunks]
  
  hometeam_name   ="Brooklyn Nets";
  hometeam_colors =["Black","White"];
  
  output[:home][:team_name]=hometeam_name
  output[:home][:colors]=hometeam_colors

  hometeam_playernames=["Alan Anderson", "Reggie Evans","Brook Lopez","Mason Plumlee","Jason Terry"];
  
  data_anderson=  [0,16,22,12,12,3,1,1];
  data_evans=     [30,14,12,12,12,12,12,7];
  data_lopez=     [11,17,17,19,10,3,1,15];
  data_plumlee=   [1,19,26,11,6,3,8,5];
  data_terry=     [31,15,19,2,2,4,11,1];

  anderson = Hash[player_keys.zip(data_anderson)]
  evans    = Hash[player_keys.zip(data_evans)]
  lopez    = Hash[player_keys.zip(data_lopez)]
  plumlee  = Hash[player_keys.zip(data_plumlee)]
  terry    = Hash[player_keys.zip(data_terry)]
  
  homeplayer_hashes = [anderson,evans,lopez,plumlee,terry,anderson]
  
  output[:home][:players]=Hash[hometeam_playernames.zip(homeplayer_hashes)]


  awayteam_name=    "Charlotte Hornets";
  awayteam_colors=  ["Turquoise", "Purple"];
  
  output[:away][:team_name]=awayteam_name
  output[:away][:colors]=awayteam_colors
  
  awayteam_playernames= ["Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"];

  data_adrien=    [4,18,10,1,1,2,7,2];
  data_biyombo=   [0,16,12,4,7,22,15,10];
  data_diop=      [2,14,24,12,12,4,5,5];
  data_gordon=    [8,15,33,3,2,1,1,0];
  data_walker=    [33,15,6,12,12,7,5,12];
  
  adrien  = Hash[player_keys.zip(data_adrien)]
  biyomo  = Hash[player_keys.zip(data_biyombo)]
  diop    = Hash[player_keys.zip(data_diop)]
  gordon  = Hash[player_keys.zip(data_gordon)]
  walker  = Hash[player_keys.zip(data_walker)]
  
  awayplayer_hashes = [adrien,biyomo,diop,gordon,walker]
  
  output[:away][:players]=Hash[awayteam_playernames.zip(awayplayer_hashes)]

  #puts '--hash test--'
  #puts output[:home][:players]["Alan Anderson"]
  #puts '--ends hash test--'
  #puts output
  output;
end


def return_playerhash(player_name)
  output=nil;
  game=game_hash;
  
  game.each do |team_key,team_value|
    team_value[:players].each do |player_key, player_value|
      if player_key==player_name
        output = player_value
      end
    end
  end
  
  output
end



def num_points_scored(player_name)
  points=nil
  
  player_hash=return_playerhash(player_name)
  points=player_hash[:points];
  
  points
end


def shoe_size(player_name)
  size=nil
  
  player_hash=return_playerhash(player_name)
  size=player_hash[:shoe];
  
  size
end


def team_colors(selected_team)
  colors=nil

  game=game_hash
  
  game.each do |team_key, team_value|
    if team_value[:team_name]==selected_team
      colors = team_value[:colors]
    end
  end
  
  colors
end


#collect the team names
def team_names()
  names=[]

  game=game_hash
  
  game.each do |team_key, team_value|
    names.push(team_value[:team_name])
  end
  
  names
end

#collect player numbers of selected team_name
def player_numbers(selected_team)
  
  output = []
  team   = {}
  game   = game_hash
  
  game.each do |team_key, team_value|
    if team_value[:team_name]==selected_team
     team=team_value

    end
  end
  
  team[:players].each do |player|
    output.push(player[1][:number])
  end
  
  output
end

#output player stats
def player_stats(player_name)
  player_hash=return_playerhash(player_name)
  player_hash
end

def collect_all_player(game_hash)
  all_players=[]
  
  #collect all player names
  game_hash[:away][:players].each do |key,value|
    all_players.push(key)
  end
  
  game_hash[:home][:players].each do |key,value|
    all_players.push(key)
  end
  return all_players
end

def big_shoe_rebounds
  max_size=0
  output_rebounds=0
  all_playernames=[]
  
  game   = game_hash
  
  all_playernames=collect_all_player(game)
  
  all_playernames.each do |player_name|
  
    shoe_size=shoe_size(player_name)
    if shoe_size>max_size
      max_size=shoe_size
      stats=player_stats(player_name)
      output_rebounds=stats[:rebounds]
    end
  end
  
  output_rebounds
end

