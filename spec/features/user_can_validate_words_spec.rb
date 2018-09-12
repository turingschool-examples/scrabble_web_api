# Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading
#
# Feature:
# As a guest user (no sign in necessary)
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
#
# As a guest user
# When I visit "/"
# And I fill in a text box with "foxez"
# And I click "Validate Word"
# Then I should see a message that says "'foxez' is not a valid word."

require 'rails_helper'

describe 'visiting /' do
  context 'as a guest' do
    it 'can validate words' do
      visit '/'

      fill_in :word_content, with: 'foxes'

      click_on 'Validate Word'

      expect(current_path).to eq('/words')
      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end
    it 'does not validate invalid words' do
      visit '/'

      fill_in :word_content, with: 'foxez'

      click_on 'Validate Word'

      expect(current_path).to eq('/words')
      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
