require './lib/peep.rb'
require 'timecop'

describe Peep do
  before do
    Timecop.freeze(DateTime.now)
  end

  describe '.new' do
    it 'makes a new peep' do
      peep = Peep.new(text:'Hi!', time:Time.now)
      expect(peep).to be_a(Peep)
    end
  end

  describe '.all' do
    it 'lists all Peeps' do
      Peep.create(text: 'Covfefe')
      Peep.create(text: 'First Peep :)')
      Peep.create(text: 'Very stable genius')
      peeps = Peep.all
      expect(peeps[0].text).to eq 'Covfefe'
      expect(peeps[1].text).to eq 'First Peep :)'
      expect(peeps[2].text).to eq 'Very stable genius'
    end

    it 'converts time into a DateTime object' do
      Peep.create(text: 'Covfefe')
      Peep.create(text: 'First Peep :)')
      Peep.create(text: 'Very stable genius')
      peeps = Peep.all
      expect(peeps[0].time).to be_a(Time)
    end

    it 'saves the time' do
      Peep.create(text: 'Covfefe')
      Peep.create(text: 'First Peep :)')
      Peep.create(text: 'Very stable genius')
      peeps = Peep.all
      expect(peeps[0].time.to_i).to be_within(1).of Time.now().to_i
    end
  end

  describe '.create' do
    it 'creates a new Peep in the database' do
      Peep.create(text: 'Try to create')
      peeps = Peep.all
      expect(peeps[0].text).to eq 'Try to create'
    end
  end
end
