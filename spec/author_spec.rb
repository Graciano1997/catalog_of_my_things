require_relative '../classes/author'
require_relative '../serializers/serializeitem'

RSpec.describe Author do
  include SerializationItem

  let(:author) { Author.new('John', 'Doe') }

  describe '#initialize' do
    it 'creates a new instance of Author' do
      expect(author).to be_an_instance_of(Author)
      expect(author).to be_a(SerializationItem)
      expect(author.id).to be_an(Integer)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the author' do
      item = double('item')
      allow(item).to receive(:id).and_return(1)
      expect(item).to receive(:author=).with('John Doe')

      author.add_item(item)

      expect(author.items).to include(1)
    end
  end
end