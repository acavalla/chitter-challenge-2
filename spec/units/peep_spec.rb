require './lib/peep.rb'

describe Peep do
  peep = Peep.new('Hi!')
  describe '.new' do
    it 'makes a new peep' do
      expect(peep).to be_a(Peep)
    end
  end
end
