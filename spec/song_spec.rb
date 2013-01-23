require 'song'

describe Song do
  let(:title) { 'Dear Prudence' }
  let(:song) { Song.new(title) }

  before do
    song.artist = 'The Beatles'
    song.album = 'The Beatles (The White Album)'
  end

  subject { song }

  its(:title) { should eq 'Dear Prudence' }
  its(:artist) { should eq 'The Beatles' }
  its(:album) { should eq 'The Beatles (The White Album)' }

  it 'has a custom #to_s method' do
    expect(song.to_s).
      to eq 'Dear Prudence - The Beatles :: The Beatles (The White Album)'
  end
end
