require 'rails_helper'

RSpec.describe 'the movies show page' do
  before(:each) do
    @studio = Studio.create!(name: 'Mountain Films', location: 'Colorado')
    @movie = @studio.movies.create!(title: 'Hiking', creation_year: 2021, genre: 'documentary')
    @actor_1 = @movie.actors.create!(name: 'Harrison Ford', age: 78)
    @actor_2 = @movie.actors.create!(name: 'Brad Pitt', age: 57)
    @actor_3 = @movie.actors.create!(name: 'Tom Hanks', age: 65)
  end

  it 'displays movie attributes' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end

  it 'displays movies actors' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
  end

  it 'orders actors by age oldest to youngest'
end
