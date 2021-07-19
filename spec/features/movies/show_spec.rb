require 'rails_helper'

RSpec.describe 'the movies show page' do
  before(:each) do
    @studio = Studio.create(name: 'Mountain Films', location: 'Colorado')
    @movie = @studio.movies.create(title: 'Hiking', creation_year: 2021, genre: 'documentary')
  end

  it 'displays movie attributes' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end
end
