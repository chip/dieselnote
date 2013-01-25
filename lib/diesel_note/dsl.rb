require 'diesel_note/catalog'
require 'diesel_note/song'

module DieselNote
# SongDSL Module
#
# Include this module to gain access to it's methods
#
# Usage:
#  song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
#  song("I'm So Tired") { {artist: 'The Beatles', album: 'The White Album'} }
#
#  find_title('Dear Prudence')
#  find_artist('The Beatles') { puts show_info }
#
  module DSL
    DieselNote::DSL_FINDER = /^find_/
    DieselNote::SongCatalog = Catalog.new

    def song(title, &block)
      new_song = Song.new(title)
      if block_given?
        block.call.each_pair do |attr,val|
          new_song.send(attr, val)
        end
      end
      DieselNote::SongCatalog.add_song(new_song)
    end

    private

    def method_missing(method, *args, &block)
      super unless method =~ DieselNote::DSL_FINDER
      finder = 'find_by_' + method.to_s.sub(DieselNote::DSL_FINDER,'')
      songs = DieselNote::SongCatalog.send(finder, *args)
      if block_given?
        songs.each do |song|
          song.instance_eval(&block)
        end
      end
    end
  end
end
