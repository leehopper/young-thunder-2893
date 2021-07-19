require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  before (:each) do
    @actor_1 = Actor.create!(name: 'Harrison Ford', age: 78)
    @actor_2 = Actor.create!(name: 'Brad Pitt', age: 57)
    @actor_3 = Actor.create!(name: 'Tom Hanks', age: 65)
  end

  describe 'class methods' do
    context '#order_by_age' do
      it 'orders actors by age youngest to oldest' do
        expect(Actor.order_by_age).to eq([@actor_2, @actor_3, @actor_1])
      end
    end

    context '#average_age' do
      it 'returns the average age of the actors' do
        expect(Actor.average_age).to eq(67)
      end
    end

    context '#search' do
      it 'returns the actor with matching name' do
        expect(Actor.search('Tom Hanks')).to eq(@actor_3)
      end
    end
  end
end
