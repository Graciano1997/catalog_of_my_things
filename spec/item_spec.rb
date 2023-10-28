require 'date'
require_relative '../classes/item'


describe Item do
    context 'when an Item is being initialized ' do
      it 'Should be an Item class instance ' do
        date_item="2023-12-10"
        item_object = Item.new(date_item)
        expect(item_object).to be_instance_of Item
      end

      it 'Should respond to :author method ' do
        date_item="2023-12-10"
        item_object = Item.new(date_item)
        expect(item_object).to respond_to(:author)
      end

      it 'Should respond to :genre, :label, :publish_date, :id, move_to_archive? methods ' do
        date_item="2023-12-10"
        item_object = Item.new(date_item)
        expect(item_object).to respond_to(:genre)
        expect(item_object).to respond_to(:label)
        expect(item_object).to respond_to(:publish_date)
        expect(item_object).to respond_to(:id)
        expect(item_object).to respond_to(:move_to_archive?)
      end

      it 'Should have @genre = nil @author = nil @label = nil methods ' do
        date_item="2023-12-10"
        item_object = Item.new(date_item)
        expect(item_object.genre).to be nil
        expect(item_object.author).to be nil
        expect(item_object.label).to be nil
        expect(item_object.id).not_to be nil
      end

      it 'id Should not be nil' do
        date_item="2023-12-10"
        item_object = Item.new(date_item)
        expect(item_object.id).not_to be nil
      end
    end

    context "when we want moving an item to archive" do
      it "should move an item to archive" do
        date_item="2010-12-10"
        item_object = Item.new(date_item)
        expect(item_object.move_to_archive?).to be true
    end

    it "should not move an item to archive" do
        date_item="2023-12-10"
        item_object = Item.new(date_item)
        expect(item_object.move_to_archive?).to be nil
    end
    end
end
