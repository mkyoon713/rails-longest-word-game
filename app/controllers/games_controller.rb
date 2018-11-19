require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    vowels_array = ['A', 'E', 'I', 'O', 'U']
    alphabet_array = ('A'..'Z').to_a
    consonants_array = alphabet_array - vowels_array
    @letters_array = []
    @letters_array << vowels_array.sample(3)
    @letters_array << consonants_array.sample(7)
    @letters = @letters_array.flatten.shuffle
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @word_array = @word.split('')
    @array = []
    @word_array.each do |letter|
      @array << letter if @letters.include?(letter)
    end

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    data_hash = open(url).read
    @data = JSON.parse(data_hash)

    @score = @word.length

    if session[:score].nil?
      session[:score] = @score
    else
      session[:score] += @score
    end

  end

  def reset
    session[:score] = 0
    redirect_to new_path
  end
end
