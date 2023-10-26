require_relative '../serializers/serializeitem'

class Author
  include SerializationItem
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = rand(0..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    return if items.include?(item.id)

    items << item.id
    item.author = "#{first_name} #{last_name}"
  end
end
