require 'date'
require_relative '../classes/item'
require_relative '../classes/label'
require_relative '../classes/book'

describe Book do
  let(:current_year) { Date.today.year }
  let(:older_year) { current_year - 11 }

  context 'when created with a cover state "good" and a publish date older than 10 years' do
    let(:publish_date) { Date.new(older_year, 1, 1) }
    subject { described_class.new('Publisher', 'good', publish_date) }

    it 'sets archived to true' do
      expect(subject.archived).to be true
    end
  end

  context 'when created with a cover state "good" and a publish date within the last 10 years' do
    let(:publish_date) { Date.new(current_year - 5, 1, 1) }
    subject { described_class.new('Publisher', 'good', publish_date) }

    it 'sets archived to false' do
      expect(subject.archived).to be false
    end
  end

  context 'when created with a cover state "bad" and a publish date older than 10 years' do
    let(:publish_date) { Date.new(older_year, 1, 1) }
    subject { described_class.new('Publisher', 'bad', publish_date) }

    it 'sets archived to true' do
      expect(subject.archived).to be true
    end
  end
end
