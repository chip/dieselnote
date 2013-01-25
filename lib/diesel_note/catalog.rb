# Catalog Class
#
# The Catalog contains Songs.  It can add &
# dynamically find a song by any attribute
#
module DieselNote
  class Catalog
    CATALOG_FINDER = /^find_by_/

      attr_reader :songs

    def initialize
      @songs = []
    end

    def add_song(song)
      @songs << song
    end

    private

    def find_song_by(attr, query)
      songs.select { |song| song.send(attr, query) == query }
    end

    def method_missing(method, query)
      super unless method.to_s =~ CATALOG_FINDER
      construct_dynamic_finder(method, query)
      send(method, query)
    end

    def construct_dynamic_finder(method, query)
      self.class.class_eval do
        define_method(method) do |query|
          attr = method.to_s.sub(CATALOG_FINDER,'').to_sym
          find_song_by(attr, query)
        end
      end
    end
  end
end
