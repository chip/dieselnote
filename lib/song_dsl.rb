require 'catalog'
require 'song'

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
module SongDSL
  DSL_FINDER = /^find_/
  SongCatalog = Catalog.new

  def song(title, &block)
    new_song = Song.new(title)
    if block_given?
      block.call.each_pair do |attr,val|
        new_song.send(attr, val)
      end
    end
    SongCatalog.add_song(new_song)
  end

  private

  def method_missing(method, *args, &block)
    super unless method =~ DSL_FINDER
    finder = 'find_by_' + method.to_s.sub(DSL_FINDER,'')
    songs = SongCatalog.send(finder, *args)
    if block_given?
      songs.each do |song|
        song.instance_eval(&block)
      end
    end
  end
end
