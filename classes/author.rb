require 'json'
require_relative 'item'
require_relative 'game'

class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name)
    @id = (rand(0..1000) + Math.cos((rand(0..360) * Math::PI) / 180)).to_i
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    raise ArgumentError, 'Only instances of the Item class can be added to the items array.' unless item.is_a?(Item)

    item.author = self
    @items << item unless @items.include?(item)
  end
end
