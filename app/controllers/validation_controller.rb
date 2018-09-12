class ValidationController < ApplicationController

  def index
    word = params[:word]
    @valid = ValidationPresenter.new(word)
  end

end
