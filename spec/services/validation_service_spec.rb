require 'rails_helper'
# require 'webmock/rspec'

describe ValidationService do
  it 'can make calls and indicate when it gets a 404' do
    word_1 = 'notaword'
    # json_response_1 = File.open('./fixtures/notaword.json')
    # stub_request(:get, "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word_1}").to_return(status: 404, body: json_response_1)

    response_1 = ValidationService.new(word_1).validation

    expect(response_1).to eq('notaword is not a valid word.')
    expect(response_1).to_not respond_to(:keys)

    word_2 = 'hello'
    # json_response_2 = File.open('./fixtures/hello.json')
    # stub_request(:get, "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word_2}").to_return(status: 200, body: json_response_2)
    response_2 = ValidationService.new(word_2).validation

    expect(response_2).to respond_to(:keys)
  end
end
