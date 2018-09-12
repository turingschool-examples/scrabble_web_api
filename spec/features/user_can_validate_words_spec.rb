require 'rails_helper'

describe 'visiting /' do
  context 'as a guest' do
    it 'can validate words' do
      visit '/'

      fill_in :word_content, with: 'foxes'

      click_on 'Validate Word'

      expect(current_path).to eq('/validation')
      expect(page).to have_content("foxes is a valid word and its root form is fox.")
    end
    it 'does not validate invalid words' do
      visit '/'

      fill_in :word_content, with: 'foxez'

      click_on 'Validate Word'

      expect(current_path).to eq('/validation')
      expect(page).to have_content("foxez is not a valid word.")
    end
  end
end
