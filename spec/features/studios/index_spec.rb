require 'rails_helper'

RSpec.describe 'the studios index' do

  it 'displays studio name and location' do
    studio_1 = Studio.create(name: 'Mountain Films', location: 'Colorado')
    studio_2 = Studio.create(name: 'Lake Films', location: 'Michigan')

    visit '/studios'

    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content(studio_1.location)
  end
end
