require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :lastplayed_at_date

  def initialize(publish_date, multiplayer, lastplayed_at_date)
    super(publish_date)
    @multiplayer = multiplayer
    @lastplayed_at_date = lastplayed_at_date
  end

  private

  def can_be_archived?
    super || (lastplayed_at_date && Date.parse(lastplayed_at_date) < (Date.today - 2 * 365))
  end
end