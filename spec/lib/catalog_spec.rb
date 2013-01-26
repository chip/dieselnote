require 'spec_helper'
require 'diesel_note/catalog'
require 'diesel_note/song'

module DieselNote
  describe Catalog do
    let(:catalog) { Catalog.new }

    let(:song) do 
      new = Song.new('Dear Prudence')
      new.artist('The Beatles')
      new
    end

    it 'starts with an empty catalog' do
      expect(catalog.songs).to be_empty
    end

    context 'catalog' do
      before { catalog.add_song(song) }

      it 'adds an a song to the catalog' do
        expect(catalog.songs).to include song
      end

      it 'finds by title' do
        expect(catalog.find_by_title('Dear Prudence')).to include(song)
      end

      it 'finds by artist' do
        expect(catalog.find_by_artist('The Beatles')).to include(song)
      end

      it 'finds multiple songs' do
        another_song = Song.new("I'm So Tired") 
        another_song.artist('The Beatles')
        catalog.add_song(another_song)
        expect(catalog.find_by_artist('The Beatles')).to eq [song, another_song]
      end

      it 'does not include non-matches' do
        new_song = Song.new('Dear Prudence')
        catalog.add_song(new_song)
        expect(catalog.find_by_artist('The Beatles')).not_to include(new_song)
      end

      it 'is empty if no songs found' do
        expect(catalog.find_by_artist('Rolling Stones')).to be_empty
      end
    end
  end
end
