require 'date'
require_relative '../classes/game'

describe Game do
  before :each do
    # multiplayer, last_played_at, genre, publish_date
    @game = Game.new(true, '02-23-2020', 'rnb', '09-12-2022')
  end

  it 'Checking Game instance' do
    expect(@game).to be_instance_of Game
  end

  it 'Returns the true for multiplayer' do
    expect(@game.multiplayer).to eql true
  end

  it 'Returns the correct last_played_at' do
    expect(@game.last_played_at).to eql '02-23-2020'
  end
end
