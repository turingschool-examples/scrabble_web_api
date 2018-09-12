class ValidationPresenter

  def initialize(word)
    @word = word
  end

  def original_word
    hash = @word['results'].first
    hash['word']
  end

  def root
    hash = @word['results'].first
    hash['lexicalEntries'].first['inflectionOf'].first['id']
  end

end
