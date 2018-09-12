require 'rails_helper'

describe ValidationPresenter do
  it 'can determine the right kind of display' do
    validation_1 = ValidationPresenter.new('Hello')

    expect(validation_1.display).to eq('Hello')

    hash = { 'results' => [{'word' => 'aword', 'lexicalEntries' => [{'inflectionOf' => [{'id' => 'wordroot'}]}]}]}
    validation_2 = ValidationPresenter.new(hash)

    expect(validation_2.display).to eq('aword is a valid word and its root form is wordroot.')
  end
end
