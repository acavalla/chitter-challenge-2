require './lib/peep.rb'

describe Peep do

  describe '.new' do
    it 'makes a new peep' do
      peep = Peep.new('Hi!')
      expect(peep).to be_a(Peep)
    end
  end

  describe '.all' do
    it 'lists all Peeps' do
      peeps = Peep.all
      expect(peeps).to include 'Covfefe'
      expect(peeps).to include 'Very stable genius'
      expect(peeps).to include 'First Peep :)'
    end
  end
end
