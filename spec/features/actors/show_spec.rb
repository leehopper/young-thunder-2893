require 'rails_helper'

RSpec.describe 'the actor show page' do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Mountain Films', location: 'Colorado')
    @studio_2 = Studio.create!(name: 'Lake Films', location: 'Michigan')
    @movie_1 = @studio_1.movies.create!(title: 'Hiking', creation_year: 2021, genre: 'documentary')
    @movie_2 = @studio_1.movies.create!(title: 'Rafting', creation_year: 2020, genre: 'action')
    @movie_3 = @studio_2.movies.create!(title: 'Surfing', creation_year: 2019, genre: 'documentary')
    @actor_1 = @movie_1.actors.create!(name: 'Harrison Ford', age: 78)
    @actor_2 = @movie_1.actors.create!(name: 'Brad Pitt', age: 57)
    @actor_3 = @movie_2.actors.create!(name: 'Tom Hanks', age: 65)
    @actor_4 = @movie_3.actors.create!(name: 'Leonardo DiCaprio', age: 46)
    @movie_3.actors << @actor_1
  end

  it 'displays actor attributes' do
    visit "/actors/#{@actor_1.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_1.age)
  end

  xit 'displays actors that this actor has worked with' do
    visit "/actors/#{@actor_1.id}"

    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_4.name)
  end
end
