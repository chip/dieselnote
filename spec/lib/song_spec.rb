require 'spec_helper'
require 'song'

describe Song do
  let(:title) { 'Dear Prudence' }
  let(:song) { Song.new(title) }

  subject { song }

  its(:title) { should eq 'Dear Prudence' }

  context '#show_info' do
    it 'includes @title' do
      expect(song.show_info).to eq SongDSLHelper.song_info
    end

    it 'includes dynamic @attributes' do
      song.artist('The Beatles')
      song.album('The White Album')
      expect(song.show_info).to eq SongDSLHelper.song_info_with_attributes
    end
  end
end
