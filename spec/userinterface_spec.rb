require 'date'
require_relative '../classes/userinterface'

describe UserInterface do
  context 'when Userinterface is initialized' do
    it 'Should respond to :option method' do
      interface_object = UserInterface.new
      expect(interface_object).to respond_to(:option)
      expect(interface_object).to respond_to(:option)
    end
  end
end
