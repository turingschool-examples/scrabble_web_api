class WordsController < ApplicationController

  def create
    validation = ValidationService.new(params[:word][:content]).validation
    redirect_to validation_path(word: validation)
  end


end
