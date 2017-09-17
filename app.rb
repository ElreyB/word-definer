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
  @words = Word.all
  erb(:home)
end

post("/") do
  word = params['add_word']
  if !word.empty?
    new_word = Word.new(word)
    new_word.save
  end
  @words = Word.all
  erb(:home)
end

post("/delete") do
  word = params['delete_word']
  @words = Word.all
  @words.delete(word)
  erb(:home)
end

get('/word/:word') do
  @word = Word.find(params[:word])
  erb(:word)
end

post('/photo/delete/:word') do
  @word = Word.find(params[:word])
  @word.delete_photo
  erb(:word)
end

post('/word/:word') do
  @word = Word.find(params[:word])
  definition = params['definition']
  photo = params['photo']
  @word.add_definition(definition)
  @word.add_photo(photo)
  @word.save
  erb(:word)
end



get('/all') do
  @words = Word.all
  erb(:all)
end

get('/alphabetize') do
  @words = Word.all.sort
  erb(:alphabetize)
end
