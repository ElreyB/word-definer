require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/word'
require 'pry'

get('/') do
  start_word1 = Word.new("apple")
  start_word1.add_definition("a fruit")
  start_word1.save

  start_word2 = Word.new("play")
  start_word2.add_definition("to enjoy one time with an activity")
  start_word2.save

  start_word3 = Word.new("snow")
  start_word3.add_definition("water in a solid form")
  start_word3.save
  @error = nil
  @words = Word.all
  erb(:home)
end

get('/word/:word') do
  @word = Word.find(params[:word])
  erb(:word)
end

post("/") do
  word = params['word']
  definition = params['definition']
  new_word = Word.new(word)
  new_word.add_definition(definition)
  @error = new_word.save
  @words = Word.all
  erb(:home)
end
