require 'date'
class Item
  attr_accessor :author, :genre, :label, :publish_date, :id
  private attr_writer :archived
  attr_reader :archived

  def initialize(publish_date)
    @id = (rand(0..1000) + Math.sin((rand(0..360) * Math::PI) / 180)).to_i
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = Date.parse(publish_date.to_s)
    @archived = can_be_archived?
  end

  def move_to_archive?
    self.archived = true if can_be_archived? == true
  end

  private
  def can_be_archived?
    (Date.today.year - publish_date.year) > 10
  end
end
