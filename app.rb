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
    if @game.current_turn == @game.player_1
      @game.attack(@game.player_2)
    else
      @game.attack(@game.player_1)
    end
    erb :attack
  end


end
