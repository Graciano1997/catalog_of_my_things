require 'date'
require_relative '../classes/author'

describe Author do
  context 'when Author  is initialized' do
    it 'Should be an Author class instance ' do
      first_name = 'Gra'
      last_name = 'Henrique'
      author_object = Author.new(first_name, last_name)
      expect(author_object).to be_instance_of Author
    end

    it 'Should respond to :first_name, :last_name, :items, :id methods ' do
      first_name = 'Gra'
      last_name = 'Henrique'
      author_object = Author.new(first_name, last_name)
      expect(author_object).to respond_to(:first_name)
      expect(author_object).to respond_to(:last_name)
      expect(author_object).to respond_to(:items)
      expect(author_object).to respond_to(:id)
    end

    it ' @items should be Empty  ' do
      first_name = 'Kirty'
      last_name = 'Sama'
      author_object = Author.new(first_name, last_name)
      expect(author_object.items.length).to be 0
    end

    it ' Should match the Kirty name  ' do
      first_name = 'Kirty'
      last_name = 'Sama'
      author_object = Author.new(first_name, last_name)
      expect(author_object.first_name).to match(/Kirty/i)
    end
  end
end
