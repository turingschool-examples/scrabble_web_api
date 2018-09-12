require 'rails_helper'

describe 'POST /api/v1/games/1/plays' do
  it 'can add words to the game by posting to the right route with user_id and word params' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)
    expected = { 'game_id' => game.id, 'scores' => [{'user_id' => josh.id, 'score' => 17}, {'user_id' => sal.id, 'score' => 16}]}

    post '/api/v1/games/1/plays?user_id=1&word=at'

    expect(response.status).to eq(201)

    get "/api/v1/games/#{game.id}"

    expect(JSON.parse(response.body)).to eq(expected)
  end
end
