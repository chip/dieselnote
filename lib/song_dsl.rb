require 'catalog'
require 'song'

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
    songs.each do |song|
      song.instance_eval(&block)
    end
  end
end
