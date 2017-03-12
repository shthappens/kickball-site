require "erb"
require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>
  <ul>
  <ol><h2><a href='/teams'>Teams</a></h2></ol>
  <ol><h2><a href='/players'>Players</a></h2></ol>
  <ol><h2><a href='/positions'>Positions</a></h2></ol>"
end

get "/teams" do
  @team_names = Team.all
  erb :teams
end

get "/teams/:team_name" do
  @players = Team.players(params[:team_name])
  erb :team_info
end

get "/players" do
  @players_all = Player.all
  erb :players
end

get "/positions" do
  @positions = Team::POSITIONS
  erb :positions
end

get "/positions/:position" do
  @players = Player.players_by_position(params[:position])
  erb :players_by_position
end
