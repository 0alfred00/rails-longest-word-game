require 'open-uri'
require 'json'

class PagesController < ApplicationController
  # helper methods
  def generate_grid
    charset = Array('A'..'Z')
    Array.new(10) { charset.sample }
  end

  def english_word?
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@attempt}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?
    @attempt.chars.all? { |letter| @attempt.count(letter) <= @grid.count(letter) }
  end

  # page methods
  def new
    @letters = generate_grid
  end

  def score
    # raise
    @grid = params[:letters].split
    @attempt = params[:attempt]
    @is_english_word = english_word?
    @is_in_grid = included?
  end
end
