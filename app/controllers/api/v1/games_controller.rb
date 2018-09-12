class Api::V1::GamesController < ApplicationController

  def show
    game = Game.find(params[:id])
    binding.pry
    render json: GameSerializer.new(game)
  end

end
