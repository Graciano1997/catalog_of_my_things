require 'date'
require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'when Label is initialized' do
    it 'Should be an Label class instance ' do
      title = 'Microverse'
      color = 'Purple'
      label_object = Label.new(title, color)
      expect(label_object).to be_instance_of Label
    end

    it 'Should respond to :title, :color, :id  :items methods ' do
      title = 'Microverse'
      color = 'Purple'
      label_object = Label.new(title, color)
      expect(label_object).to respond_to(:title)
      expect(label_object).to respond_to(:color)
      expect(label_object).to respond_to(:items)
    end

    it 'Should have @items should be Empty  ' do
      title = 'Microverse'
      color = 'Purple'
      label_object = Label.new(title, color)
      expect(label_object.items.length).to be 0
    end

    it 'Title Should Match Microverse ' do
      title = 'Microverse'
      color = 'Purple'
      label_object = Label.new(title, color)
      expect(label_object.title).to match(/Microverse/i)
    end

    it 'id Should not be nil' do
      title = 'Microverse'
      color = 'Purple'
      label_object = Label.new(title, color)
      expect(label_object.id).not_to be nil
    end

    it 'items Should have one book element' do
      title = 'Microverse'
      color = 'Purple'
      label_object = Label.new(title, color)
      book_item = Book.new('Graciano', 'Good', '2023-12-12')
      label_object.add_item(book_item)
      expect(label_object.items.length).to be 1
    end
  end
end
