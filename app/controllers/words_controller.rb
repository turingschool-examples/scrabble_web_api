class WordsController < ApplicationController

  def create
    validation = ValidationService.new(params[:word][:content])
  end


end
