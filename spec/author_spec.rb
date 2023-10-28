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

    # it 'Should have @items should be Empty  ' do
    #   title = 'Microverse'
    #   color = 'Purple'
    #   label_object = Label.new(title,color)
    #   expect(label_object.items.length).to be 0
    # end

    # it 'Title Should Match Microverse ' do
    #   title = 'Microverse'
    #   color = 'Purple'
    #   label_object = Label.new(title,color)
    #   expect(label_object.title).to match /Microverse/i
    # end

    # it 'Color Should Match Purple ' do
    #   title = 'Microverse'
    #   color = 'Purple'
    #   label_object = Label.new(title,color)
    #   expect(label_object.color).to match /Purple/i
    # end

    # it 'id Should not be nil' do
    #   title = 'Microverse'
    #   color = 'Purple'
    #   label_object = Label.new(title,color)
    #   expect(label_object.id).not_to be nil
    # end

    # it 'items Should have one book element' do
    #   title = 'Microverse'
    #   color = 'Purple'
    #   label_object = Label.new(title,color)
    #   book_item=Book.new("Graciano","Good","2023-12-12")
    #   label_object.add_item(book_item)
    #   expect(label_object.items.length).to be 1
    # end
  end
end
