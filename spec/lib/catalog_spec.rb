require 'spec_helper'
require 'catalog'

describe Catalog do
  let(:catalog) { Catalog.new }
  let(:song) { double('song', title: 'Dear Prudence', artist: 'The Beatles') } 

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
      another_song = double('song', title: "I'm So Tired", artist: 'The Beatles')
      catalog.add_song(another_song)
      expect(catalog.find_by_artist('The Beatles')).to eq [song, another_song]
    end
  end
end
