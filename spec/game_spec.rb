require_relative '../classes/game'

RSpec.describe Game do
  let(:game) { Game.new('Super Mario', '2022-01-01', true) }

  describe '#initialize' do
    it 'creates a new instance of Game' do
      expect(game).to be_an_instance_of(Game)
      expect(game.type).to eq('GAME')
      expect(game.title).to eq('Super Mario')
      expect(game.published_date).to eq('2022-01-01')
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to be_nil
      expect(game.author).to be_nil
    end
  end

  describe '#can_be_archived?' do
    context 'when last_played_at is nil' do
      it 'returns false' do
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when last_played_at is recent' do
      it 'returns false' do
        game.instance_variable_set(:@last_played_at, Time.now - (1 * 365 * 24 * 60 * 60))
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when last_played_at is old' do
      it 'returns true' do
        game.instance_variable_set(:@last_played_at, Time.now - (3 * 365 * 24 * 60 * 60))
        expect(game.send(:can_be_archived?)).to eq(true)
      end
    end
  end
end