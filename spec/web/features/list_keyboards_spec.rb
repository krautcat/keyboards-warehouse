require 'features_helper'

RSpec.describe 'List keyboards' do
  it 'displays each keyboard build on the page' do
    visit '/keyboards'

    within '#keyboards' do
      expect(page).to have_css('.keyboard', count: 2)
    end
  end
end
