require_relative '../classes/music_album'
require 'date'

describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when the album meets age and Spotify criteria' do
      it 'returns true' do
        music_album = MusicAlbum.new(Date.today - (10 * 365), true)
        expect(music_album.can_be_archived?).to eq(true)
      end
    end

    context 'when the album is not old enough' do
      it 'returns false' do
        music_album = MusicAlbum.new(Date.today - (5 * 365), true)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end

    context 'when the album is not listed in Spotify' do
      it 'returns false' do
        music_album = MusicAlbum.new(Date.today - (10 * 365), false)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end

    context 'when the album is neither old enough nor listed in Spotify' do
      it 'returns false' do
        music_album = MusicAlbum.new(Date.today - (5 * 365), false)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end
  end
end