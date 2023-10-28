require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :lastplayed_at

  def initialize(publish_date, multiplayer, lastplayed_at)
    super(publish_date)
    @multiplayer = multiplayer
    @lastplayed_at = lastplayed_at
  end

  def can_be_archived?
     super
    #  super && (((Date.today.year - @lastplayed_at.year)) > 2)
  end
end