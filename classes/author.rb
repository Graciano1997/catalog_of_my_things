class Author
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
  end
end
