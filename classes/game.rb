require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title
  attr_reader :author

  def initialize(title, published_date, multiplayer, last_played_at = nil)
    super('GAME', published_date)

    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at unless last_played_at.nil?
    @author = nil
  end

  private

  def can_be_archived?
    unless last_played_at.nil?
      age_in_seconds = Time.now - last_played_at

      return age_in_seconds > (2 * 365 * 24 * 60 * 60)
    end

    false
  end
end