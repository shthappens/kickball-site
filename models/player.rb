require_relative "./team_data"

class Player

  attr_reader :name, :position, :team_name

   def initialize(name, position, team_name)
     @name = name
     @position = position
     @team_name = team_name
   end

   def self.players_by_position(player_position)
     @players = []
     TeamData::ROLL_CALL.each do |team, players|
       players.each do |position, player|
         if position.to_s == player_position
           @players << Player.new(player, position, team)
         end
       end
     end
     @players
   end

   def self.all
     @players_all = []
     TeamData::ROLL_CALL.each do |team, players|
       players.each do |name, position|
         @players_all << new(name, position, team)
       end
     end
     @players_all
   end

end
