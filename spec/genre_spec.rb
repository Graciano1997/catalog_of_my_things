require 'date'
require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  context 'when Genre is being initialized' do
    it 'Should be an Genre class instance ' do
      name = 'Pop'
      genre_object = Genre.new(name)
      expect(genre_object).to be_instance_of Genre
    end

    it 'Should respond to :name, :id, :items methods ' do
      name = 'Pop'
      genre_object = Genre.new(name)
      expect(genre_object).to respond_to(:name)
      expect(genre_object).to respond_to(:id)
      expect(genre_object).to respond_to(:items)
    end

    it 'Should have zero music in the Album ' do
      name = 'Pop'
      genre_object = Genre.new(name)
      expect(genre_object.items.length).to be 0
    end

    it 'Should have 2 music in the Album ' do
      name = 'Pop'
      genre_object = Genre.new(name)

      publish_date = '2023-12-12'
      on_spotify = true
      music_item = MusicAlbum.new(publish_date, on_spotify)
      music_item1 = MusicAlbum.new(publish_date, on_spotify)
      genre_object.add_item(music_item)
      genre_object.add_item(music_item1)
      expect(genre_object.items.length).to be 2
    end
  end
end
