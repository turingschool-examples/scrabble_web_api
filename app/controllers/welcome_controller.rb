class WelcomeController < ApplicationController
  def index
    @word = Word.new
  end
end
