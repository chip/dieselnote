require 'spec_helper'
require 'song'

describe Song do
  let(:title) { 'Dear Prudence' }
  let(:song) { Song.new(title) }

  before do
    song.artist = 'The Beatles'
  end

  subject { song }

  its(:title) { should eq 'Dear Prudence' }
  its(:artist) { should eq 'The Beatles' }

  context '#info' do
    it 'includes @title & @song' do
      expect(song.info).to eq SongDSLHelper.song_info
    end

    it 'includes dynamic @attributes' do
      song.album('The White Album')
      expect(song.info).to eq SongDSLHelper.song_info_with_attributes
    end
  end
end
