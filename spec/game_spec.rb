require 'rspec'
require 'date'
require_relative '../classes/item'
require_relative '../classes/game'
RSpec.describe Game do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:multiplayer) { true }
  let(:lastplayed_at) { '2023-01-01' }

  subject(:game) { described_class.new(publish_date, multiplayer, lastplayed_at) }

  describe '#initialize' do
    it 'sets the attributes correctly' do
      expect(game.publish_date).to eq(publish_date)
      expect(game.multiplayer).to eq(multiplayer)
      expect(game.lastplayed_at).to eq(lastplayed_at)
      expect(game.archived).to be_falsey
    end
  end

  describe '#can_be_archived?' do
    context 'when lastplayed_at is empty' do
      let(:lastplayed_at) { '' }

      it 'returns false' do
        expect(game.can_be_archived?).to be_falsey
      end
    end

    context 'when lastplayed_at is nil' do
      let(:lastplayed_at) { nil }

      it 'returns false' do
        expect(game.can_be_archived?).to be_falsey
      end
    end

    context 'when super can_be_archived? is false' do
      before { allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false) }

      it 'returns false' do
        expect(game.can_be_archived?).to be_falsey
      end
    end
  end

  describe '#move_to_archive?' do
    context 'when can_be_archived? is true' do
      before { allow(game).to receive(:can_be_archived?).and_return(true) }

      it 'sets archived to true' do
        game.move_to_archive?
        expect(game.archived).to be_truthy
      end
    end

    context 'when can_be_archived? is false' do
      before { allow(game).to receive(:can_be_archived?).and_return(false) }

      it 'does not set archived to true' do
        game.move_to_archive?
        expect(game.archived).to be_falsey
      end
    end
  end
end
