require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
         {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
         { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
         { player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        { player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        { player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        { player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        { player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(player_name)
# TODO this method

<<<<<<< HEAD
  # Given a name, I want to find the number of points scored
  # by this player in the game_hash

  # We need to figure out what team they are on.
  # Finding that person
  # Returning back the data we care about

  # players = game_hash.values.map do |team_info|
  #   # game_hash.values
  #   # => [ data at the :home key, data at the :away team]
  #   # .map
  #   # team_info => :home, team_info => :away
  #   team_info[:players]
  # end

  # new_players = players.flatten

  new_players = get_all_players

  # found_player = new_players.find do |player_hash|
  #   player_hash[:player_name] == player_name
  # end

  found_player = find_player(new_players, player_name)

  found_player[:points]
end

def rebounds_for_player(player_name)
=======
=begin
  players = game_hash.values.map do |team_info|
    team_info[:players]
end

  new_players = players.flatten

  found_player = new_players.find do |player_hash|
    player_hash[:player_name] == player_name
  end

  found_player[:points]
=end

  new_players = get_all_players

  #found_player = new_players.find do |player_hash|
    #player_hash[:player_name] == player_name
  #end
  found_player = find_player(new_players, player_name)
  found_player[:points]
end

def rebounds_for_players(player_name)
>>>>>>> 215c84927c03dfeb5bcffb6bae96b99df1e0c79c
  players = get_all_players
  found_player = find_player(players, player_name)
  found_player[:rebounds]
end

def get_all_players
  game_hash.values.map do |team_info|
    team_info[:players]
  end.flatten
end

def find_player(players, player_name)
  players.find do |player|
    player[:player_name] == player_name
  end
end

puts num_points_scored("Alan Anderson")
<<<<<<< HEAD
puts rebounds_for_player("Alan Anderson")
=======
puts rebounds_for_players("Alan Anderson")
>>>>>>> 215c84927c03dfeb5bcffb6bae96b99df1e0c79c
