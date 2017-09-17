require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/word'
require 'pry'


get('/') do
  start_word1 = Word.new("apple")
  start_word1.add_definition("a fruit")
  start_word1.save
  
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

get('/instructions') do
  erb(:instructions)
end
