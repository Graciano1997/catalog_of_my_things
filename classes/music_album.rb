require 'date'
require_relative 'genre'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :id, :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @id = Random.rand(1...1000)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) >= 10 && @on_spotify
  end
end
