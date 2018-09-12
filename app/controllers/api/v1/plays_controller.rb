class Api::V1::PlaysController < ApplicationController

  def create
    user = User.find(params[:user_id])
    game = Game.find(params[:game_id])
    user.plays.create(word: params[:word], game: game)
    render json: {message: 'Play Created'}, status: 201
  end

end
