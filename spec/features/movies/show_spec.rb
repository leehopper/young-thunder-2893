require 'rails_helper'

RSpec.describe 'the movies show page' do
  before(:each) do
    @studio = Studio.create!(name: 'Mountain Films', location: 'Colorado')
    @movie = @studio.movies.create!(title: 'Hiking', creation_year: 2021, genre: 'documentary')
    @actor_1 = @movie.actors.create!(name: 'Harrison Ford', age: 78)
    @actor_2 = @movie.actors.create!(name: 'Brad Pitt', age: 57)
    @actor_3 = @movie.actors.create!(name: 'Tom Hanks', age: 65)
    @actor_4 = Actor.create!(name: 'Leonardo DiCaprio', age: 46)
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
    expect(page).to_not have_content(@actor_4.name)
  end

  it 'displays average age of actors' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content("Average Age of Actors: #{@movie.actors.average_age}")
  end

  it 'orders actors by age oldest to youngest' do
    visit "/movies/#{@movie.id}"

    youngest = find("#actor-#{@actor_2.id}")
    middle = find("#actor-#{@actor_3.id}")
    oldest = find("#actor-#{@actor_1.id}")

    expect(youngest).to appear_before(middle)
    expect(middle).to appear_before(oldest)
  end

  it 'displays form to add an actor' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content('Add actor:')
  end

  it 'add actor form adds actor to movie' do
    visit "/movies/#{@movie.id}"

    fill_in 'actor', with: 'Leonardo DiCaprio'
    click_button 'Submit'

    expect(current_path).to eq("/movies/#{@movie.id}")

    within("#actor-#{@actor_4.id}") do
      expect(page).to have_content(@actor_4.name)
    end
  end
end
