class PagesController < ApplicationController
  def generate_grid
    charset = Array('A'..'Z')
    Array.new(10) { charset.sample }
  end

  def new
    @letters = generate_grid
    @attempt = params[:attempt]
  end

  def score
    @score = "score" # tbd
  end
end
