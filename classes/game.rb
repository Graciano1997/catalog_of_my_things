class Item
    attr_accessor :archived
    attr_reader :publish_date
  
    def initialize(publish_date = Date.today)
      @publish_date = publish_date
      @archived = false
    end
  
    def can_be_archived?
      years_since_publish = (Date.today - publish_date).to_i / 365
      years_since_publish >= 10
    end
  
    def move_to_archive
      @archived = can_be_archived?
    end
  end