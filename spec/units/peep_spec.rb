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
      expect(peeps[0]).to include 'Covfefe'
      expect(peeps[1]).to include '2021-05-12 11:59:45'
      expect(peeps[2]).to include 'First Peep :)'
      expect(peeps[3]).to include 'Very stable genius'
    end
  end
end
