require 'rails_helper'

RSpec.describe 'the studios index' do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Mountain Films', location: 'Colorado')
    @studio_2 = Studio.create!(name: 'Lake Films', location: 'Michigan')
  end

  it 'displays studio name and location' do
    visit '/studios'

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
    expect(page).to have_content(@studio_1.location)
  end

  it 'displays moves for each studio' do
    movie_1 = @studio_1.movies.create!(title: 'Hiking', creation_year: 2021, genre: 'documentary')
    movie_2 = @studio_1.movies.create!(title: 'Rafting', creation_year: 2020, genre: 'action')
    movie_3 = @studio_2.movies.create!(title: 'Surfing', creation_year: 2019, genre: 'documentary')

    visit '/studios'

    within("#studio-#{@studio_1.id}") do
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to_not have_content(movie_3.title)
    end

    within("#studio-#{@studio_2.id}") do
      expect(page).to have_content(movie_3.title)
      expect(page).to_not have_content(movie_1.title)
      expect(page).to_not have_content(movie_2.title)
    end
  end
end
