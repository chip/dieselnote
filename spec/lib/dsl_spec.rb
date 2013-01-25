require 'spec_helper'
require 'diesel_note/dsl'

module DieselNote
  describe DSL do
    include DSL

    it 'adds a song' do
      new_song = double('new_song')
      Song.should_receive(:new).with('Dear Prudence') { new_song }
      new_song.should_receive(:artist).with('The Beatles')
      new_song.should_receive(:album).with('The White Album')
      Catalog.any_instance.should_receive(:add_song).with(new_song)

      song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
    end

    it 'shows info for a song with a dynamic finder' do
      found_songs = double('found_songs')
      song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }

      Catalog.any_instance.should_receive(:find_by_title).with('Dear Prudence').
        and_return([found_songs])

      [found_songs].first.should_receive(:show_info)

      find_title('Dear Prudence') { show_info }
    end

    it 'finds many songs with a dynamic finder' do
      song('Dear Prudence') { {artist: 'The Beatles', album: 'The White Album'} }
      song("I'm So Tired") { {artist: 'The Beatles', album: 'The White Album'} }

      find_artist('The Beatles')
    end
  end
end
