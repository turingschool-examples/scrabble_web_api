require 'rails_helper'

describe ValidationService do
  it 'can make calls and indicate when it gets a 404' do
    word_1 = 'notaword'

    response_1 = ValidationService.new(word_1).validation

    expect(response_1).to eq('notaword is not a valid word.')
    expect(response_1).to_not respond_to(:keys)

    word_2 = 'hello'

    response_2 = ValidationService.new(word_2).validation

    expect(response_2).to respond_to(:keys)
  end
end
