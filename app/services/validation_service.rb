class ValidationService

  def initialize(word)
    @word = word
  end

  def validation
    validate
  end

  private
  def conn
    Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1') do |faraday|
      faraday.headers['app_id'] = ENV['SCRABBLE_APP_ID']
      faraday.headers['app_key'] = ENV['SCRABBLE_APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def request
    binding.pry
    JSON.parse(conn.get("/inflections/en/#{@word}").body)
  end

  def validate
    request
  end

end
