require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class  Battle < Sinatra::Base
  enable :sessions
  run! if app_file == $0

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name], 60)
    player_2 = Player.new(params[:player_2_name], 60)
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent_turn)
    erb :attack
  end

end
