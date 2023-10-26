require 'json'
require_relative 'book'
require_relative 'label'

class Persistance
  attr_accessor :labels, :books

  def initialize
    unless Dir.exist?('db')
      Dir.mkdir('db')
      Dir.chdir('./db')
      `touch books.json`
      `touch labels.json`
      Dir.chdir('../')
    end
    @books = load_books || []
    @labels = load_labels || []
  end

  def load_book_item(id)
    if !File.empty?('./db/books.json')
      book_base = JSON.parse(File.read('./db/books.json'))
      book_item = nil
      book_base.each do |book|
          if book['id'].to_i == id.to_i
          book_item = book
          break
          end
      end
      book_item
    end
  end

  def load_labels
    unless File.empty?('./db/labels.json')
      label_base = JSON.parse(File.read('./db/labels.json'))
      labels = []
      label_base.each do |label|
        label_item = Label.new(label['title'], label['color'])
        label_item.id = label['id']
        label['items_id'].each do |item|
          if(load_book_item(item))
          book_item_data = load_book_item(item)
          book_item=Book.new(book_item_data["publisher"], book_item_data["cover_state"], book_item_data["publish_date"])
          book_item.id=book_item_data["id"]
          label_item.add_item(book_item)
          end
        end
        labels << label_item
      end
    end
    @labels = labels
  end

  def load_books
    unless File.empty?('./db/books.json')
      book_base = JSON.parse(File.read('./db/books.json'))
      books = []
      book_base.each do |book|
        book_item = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        book_item.id = book['id']
        book_label = Label.new(book['title'], book['color'])
        book_label.id = book['id_label']
        book_item.label = book_label
        books << book_item
      end
    end
    @books = books
  end

  def book_hashed(books)
    book_objects = []
    books.each do |book|
      book_hash = {}
      book_hash['id'] = book.id.to_i
      book_hash['title'] = book.label.title.to_s
      book_hash['color'] = book.label.color.to_s
      book_hash['id_label'] = book.label.id.to_i
      book_hash['publisher'] = book.publisher.to_s
      book_hash['cover_state'] = book.cover_state.to_s
      book_hash['publish_date'] = book.publish_date
      book_objects << book_hash
    end
    book_objects
  end

  def label_hashed(labels)
    items_objects = []
    label_objects = []

    labels.each do |label|
      label_hash = {}
      label_hash['id'] = label.id.to_i
      label_hash['title'] = label.title.to_s
      label_hash['color'] = label.color.to_s
      items_key = []
      label.items.each do |item|
      items_key << item.id.to_i
      end
    label_hash['items_id'] = items_key
    label_objects << label_hash
    end
    label_objects
  end

  def save_all(books,labels)
    File.write('./db/books.json', JSON.pretty_generate(book_hashed(books)), mode: 'w')
    File.write('./db/labels.json', JSON.pretty_generate(label_hashed(labels)), mode: 'w')
    puts '***Saving all 📚📚 ...'
    puts '________________________Saved 100% successfully ✅✅___________________________________________'
  end
end
