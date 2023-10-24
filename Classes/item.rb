class Item
    attr_accessor :genre, :author, :label, :publish_date, :archived
  
    def initialize(publish_date, archived: true)
      @id = Random.rand(1..1000)
      @genre = nil
      @author = nil
      @label = nil
      @publish_date = publish_date || Date.today
      @archived = archived
    end
  
    def can_be_archived?
      years_since_publish = Date.today.year - @publish_date.year
      years_since_publish >= 10
    end
  
    def move_to_archive
      @archived = can_be_archived?
    end
end
  