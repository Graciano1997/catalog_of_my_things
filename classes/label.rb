class Label
  attr_accessor :title, :color, :add_item, :id
  attr_reader :items

  def initialize(title, color)
    @id = (rand(0..1000) + Math.cos((rand(0..360) * Math::PI) / 180)).to_i
    @title = title.to_s
    @color = color.to_s
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
