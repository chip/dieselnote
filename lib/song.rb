class Song
  attr_reader :title
  attr_accessor :artist, :album

  def initialize(title)
    @title = title
  end

  def to_s
    "#{title} - #{artist} :: #{album}"
  end
end
