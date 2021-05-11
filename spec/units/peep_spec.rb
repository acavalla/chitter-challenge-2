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
      expect(peeps.length).to eq 3
      expect(peeps).to include 'Covfefe'
    end
  end
end
