require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('home', {:type => :feature}) do
  before() do
    Word.clear
  end

  it 'displays words on page' do
    visit('/')
    expect(page).to have_content("apple")
  end

  it 'displays new word in list' do
    visit('/')
    fill_in('add_word', :with => "banana")
    click_button('Add')
    expect(page).to have_content("banana")
  end

  it 'removes word in list' do
    visit('/')
    fill_in('add_word', :with => "banana")
    click_button('Add')
    fill_in('delete_word', :with => "banana")
    click_button('Delete')
    expect(page).to have_no_content("banana")
  end
end

describe('word', {:type => :feature}) do
  it 'displays word' do
    visit('/')
    fill_in('add_word', :with => "banana")
    click_button('Add')
    visit('/word/banana')
    expect(page.find('//h2')).to have_content("banana")
  end

  it "displays word's definition" do
    visit('/word/banana')
    fill_in('definition', :with => "a fruit")
    click_button('✏️')
    expect(page.find('//li')).to have_content("a fruit")
  end

  it "displays error message" do
    visit('/word/banana')
    fill_in('definition', :with => "")
    click_button('📷')
    expect(page.find('//h4')).to have_content("Input Error")
  end
end

describe('all', {:type => :feature}) do
  it 'displays word' do
    visit('/')
    fill_in('add_word', :with => "banana")
    click_button('Add')
    visit('/all')
    expect(page).to have_content("banana")
  end

  it 'displays definitions' do
    visit('/')
    fill_in('add_word', :with => "banana")
    click_button('Add')
    visit('/all')
    expect(page).to have_content("a fruit")
  end
end
