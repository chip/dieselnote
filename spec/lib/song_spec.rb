require 'spec_helper'
require 'song'

describe Song do
  let(:artist) { 'The Beatles' }
  let(:title) { 'Dear Prudence' }
  let(:song) { Song.new(title, artist) }

  subject { song }

  its(:title) { should eq 'Dear Prudence' }
  its(:artist) { should eq 'The Beatles' }

  context '#show_info' do
    it 'includes @title & @song' do
      expect(song.show_info).to eq SongDSLHelper.song_info
    end

    it 'includes dynamic @attributes' do
      song.album('The White Album')
      expect(song.show_info).to eq SongDSLHelper.song_info_with_attributes
    end
  end
end
