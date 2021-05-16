require './lib/peep.rb'
require 'timecop'
require 'database_helpers'

describe Peep do
  before do
    Timecop.freeze(DateTime.now)
  end

  describe '.new' do
    it 'makes a new peep' do
      peep = Peep.new(text:'Hi!', time:Time.now, id: 1)
      expect(peep).to be_a(Peep)
    end
  end

  describe '.all' do
    it 'lists all Peeps' do
      peep = Peep.create(text: 'Covfefe')
      Peep.create(text: 'First Peep :)')
      Peep.create(text: 'Very stable genius')
      peeps = Peep.all
      expect(peeps[0].text).to eq 'Covfefe'
      expect(peeps[0].id).to eq peep.id
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
      expect(peeps[0].time.to_i).to eq Time.now().to_i
    end
  end

  describe '.create' do
    it 'creates a new Peep in the database' do
      peep = Peep.create(text: 'Try to create')
      persisted_peep = persisted_data(id: peep.id)
      expect(peep.text).to eq 'Try to create'
      expect(peep.id).to eq persisted_peep['id']
    end
  end
end
