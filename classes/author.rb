require 'json'
require_relative 'item'

class Author
    attr_accessor :first_name, :last_name, :items
    attr_reader :id
  
    def initialize(first_name, last_name)
      @id = Random.rand(1..500)
      @first_name = first_name
      @last_name = last_name
      @items = []
    end
  
    def add_item(item)
      raise ArgumentError, 'Only instances of the Item class can be added to the items array.' unless item.is_a?(Item)
  
      @items << item unless @items.include?(item)
      item.author = self
    end
  end

#   def to_json(*_args)
#     {
#       'first_name' => first_name,
#       'last_name' => last_name,
#       'items' => items.map(&:to_json)
#     }.to_json
#   end

#   def self.from_json(json)
#     data = JSON.parse(json)
#     author = new(data['first_name'], data['last_name'])
#     data['items'].each do |item_json|
#       item = Item.from_json(item_json)
#       item.author = author
#       author.items << item
#     end
#     author
#   end
