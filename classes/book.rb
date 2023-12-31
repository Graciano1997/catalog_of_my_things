require 'date'
require_relative 'item'
require_relative 'label'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || cover_state.eql?('bad') ? true : false
  end
end
