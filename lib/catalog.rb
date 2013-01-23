class Catalog
  attr_reader :songs

  def initialize
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  private

  def find_song_by(attr, query)
    songs.select { |s| s.send(attr) == query }
  end

  def method_missing(method, query)
    finder = method.to_s
    if finder =~ /find_by_/
      self.class.class_eval do 
        define_method(method) do |query|
          attr = finder.sub(/find_by_/,'')
          find_song_by(attr.to_sym, query)
        end
      end
      send(method, query)
    else
      super
    end
  end
end
