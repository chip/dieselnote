require 'spec_helper'
require 'diesel_note/dsl'

module DieselNote
  describe DSL do
    include DSL

    it 'adds a song' do
      new_song = double('new_song')
      Song.should_receive(:new).with('Dear Prudence') { new_song }
      Catalog.any_instance.should_receive(:add_song).with(new_song)

      song('Dear Prudence')
    end

    it 'adds a song & takes an optional block' do
      new_song = double('new_song')
      Song.should_receive(:new).with('Dear Prudence') { new_song }
      new_song.should_receive(:artist).with('The Beatles')
      new_song.should_receive(:album).with('The White Album')
      Catalog.any_instance.should_receive(:add_song).with(new_song)

      song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
    end

    it 'finds a song with a dynamic finder' do
      song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
      Catalog.any_instance.should_receive(:find_by_title).with('Dear Prudence')
      find_title('Dear Prudence')
    end

    it 'finds songs & takes an optional block' do
      found_songs = [double('found_songs')]
      song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
      song("I'm So Tired") { {artist: 'The Beatles', album: 'The White Album'} }
     
      Catalog.any_instance.should_receive(:find_by_artist).with('The Beatles').
        and_return(found_songs)

      found_songs.each do |found|
        found.should_receive(:show_info)
      end

      find_artist('The Beatles') { show_info }
    end
  end
end
