require 'rails_helper'

RSpec.describe 'the movies show page' do
  before(:each) do
    @studio = Studio.create(name: 'Mountain Films', location: 'Colorado')
    @movie = @studio.movies.create(title: 'Hiking', creation_year: 2021, genre: 'documentary')
  end

  it 'displays movie attributes' do
    visit "/movies/#{@movie.id}"
  end
end
