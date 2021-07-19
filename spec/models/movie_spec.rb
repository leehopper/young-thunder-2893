require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  before (:each) do
    @actor_1 = Actor.create!(name: 'Harrison Ford', age: 78)
    @studio = Studio.create!(name: 'Mountain Films', location: 'Colorado')
    @movie = @studio.movies.create!(title: 'Hiking', creation_year: 2021, genre: 'documentary')
  end

  describe 'instance methods' do
    context '#add_actor' do
      it 'adds and actor to the movie' do
        @movie.add_actor(@actor_1.name)

        expect(@movie.actors).to eq([@actor_1])
      end
    end
  end
end
