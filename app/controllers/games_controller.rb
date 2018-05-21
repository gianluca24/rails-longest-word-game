require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    word = params[:word]
    letters = params[:letters].split(" ")
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    url_raw = open(url).read
    results = JSON.parse(url_raw)
    if results["found"]
      @message = "It's a real word!"
    else
      @message = "No way jose"
    end
  end
end
