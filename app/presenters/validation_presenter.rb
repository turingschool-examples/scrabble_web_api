class ValidationPresenter

  def initialize(word)
    @word = word
  end

  def display
    unless @word['results'].nil?
      "#{original_word} is a valid word and its root form is #{root}."
    else
      "#{@word}"
    end
  end

  private

  def original_word
    hash = @word['results'].first
    hash['word']
  end

  def root
    hash = @word['results'].first
    hash['lexicalEntries'].first['inflectionOf'].first['id']
  end

end
