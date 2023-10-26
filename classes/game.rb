require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :genre, :title, :publish_date

  def initialize(multiplayer, last_played_at, genre, publish_date)
    super(genre, author, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && age_in_years > 2
  end

  private

  def age_in_years
    Time.now.year - @last_played_at.year
  end
end
