class ValidationService

  def initialize(word)
    @word = word
  end

  def validation
    request
  end

  private
  def conn
    Faraday.new(url: 'https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV['SCRABBLE_APP_ID']
      faraday.headers['app_key'] = ENV['SCRABBLE_APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def request
    status = conn.get("/api/v1/inflections/en/#{@word}").status
    if status == 404
      "#{@word} is not a valid word."
    else
      JSON.parse(conn.get("/api/v1/inflections/en/#{@word}").body)
    end
  end

end
