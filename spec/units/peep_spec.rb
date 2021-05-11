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
      expect(Peep.all.length).to eq 3
    end
  end
end
