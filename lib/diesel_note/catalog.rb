module DieselNote
# Catalog Class
#
# The Catalog contains Songs.  It can add &
# dynamically find a song by any attribute.
#
# Usage:
#   song = Song.new('Dear Prudence')
#   catalog = Catalog.new
#   catalog.add_song(song)
#
#   find_by_title 'Dear Prudence'
#   find_by_artist 'The Beatles'
#
  class Catalog
    DieselNote::CATALOG_FINDER = /^find_by_/

    attr_reader :songs

    def initialize
      @songs = []
    end

    def add_song(song)
      @songs << song
    end

    def find_by_title(title)
      songs.select { |song| song.title == title }
    end

    private

    def find_song_by(attr, query)
      songs.keep_if do |song|
        attrs = song.instance_variable_get('@attributes') || {}
        attrs[attr] == query
      end
    end

    def method_missing(method, query)
      super unless method.to_s =~ DieselNote::CATALOG_FINDER
      construct_dynamic_finder(method, query)
      send(method, query)
    end

    def construct_dynamic_finder(method, query)
      self.class.class_eval do
        define_method(method) do |query|
          attr = method.to_s.sub(DieselNote::CATALOG_FINDER,'').to_sym
          find_song_by(attr, query)
        end
      end
    end
  end
end
