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

  it 'has a custom #to_s method' do
    expect(song.to_s).
      to eq 'Dear Prudence - The Beatles'
  end
end
