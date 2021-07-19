require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'class methods' do
    context '#order_by_age' do
      it 'orders actors by age youngest to oldest' do
        actor_1 = Actor.create!(name: 'Harrison Ford', age: 78)
        actor_2 = Actor.create!(name: 'Brad Pitt', age: 57)
        actor_3 = Actor.create!(name: 'Tom Hanks', age: 65)

        expect(Actor.order_by_age).to eq([actor_2, actor_3, actor_1])
      end
    end
  end
end
