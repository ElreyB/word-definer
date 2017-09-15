require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word', {:type => :feature}) do
  before do
    Word.clear
  end

  it 'displays words on page' do
    visit('/')
    expect(page).to have_content("apple play snow")
  end

  it 'displays new word in list' do
    visit('/')
    fill_in('word', :with => "banana")
    fill_in('definition', :with => "a fruit")
    click_button('Add to List')
    expect(page).to have_content("banana")
  end
end

describe('word', {:type => :feature}) do
  it 'displays word' do
    visit('/word/banana')
    expect(page.find('//h3')).to have_content("banana")
  end

  it "displays word's definition" do
    visit('/word/banana')
    expect(page.find('//li')).to have_content("a fruit")
  end
end
