require './lib/peep.rb'
require 'timecop'

describe Peep do
  before do
    Timecop.freeze(DateTime.now)
  end

  describe '.new' do
    it 'makes a new peep' do
      peep = Peep.new(text:'Hi!', time:DateTime.now)
      expect(peep).to be_a(Peep)
    end
  end

  describe '.all' do
    it 'lists all Peeps' do
      con = PG.connect(dbname: 'chitter_test')
      con.exec("INSERT INTO peeps (text) VALUES ('Covfefe')")
      con.exec("INSERT INTO peeps (text) VALUES ('First Peep :)')")
      con.exec("INSERT INTO peeps (text) VALUES ('Very stable genius')")
      peeps = Peep.all
      expect(peeps[0].text).to eq 'Covfefe'
      expect(peeps[1].text).to eq 'First Peep :)'
      expect(peeps[2].text).to eq 'Very stable genius'
    end

    it 'converts time into a DateTime object' do
      con = PG.connect(dbname: 'chitter_test')
      con.exec("INSERT INTO peeps (text) VALUES ('Covfefe')")
      con.exec("INSERT INTO peeps (text) VALUES ('First Peep :)')")
      con.exec("INSERT INTO peeps (text) VALUES ('Very stable genius')")
      peeps = Peep.all
      expect(peeps[0].time).to be_a(Time)
    end

    it 'saves the time' do
      con = PG.connect(dbname: 'chitter_test')
      con.exec("INSERT INTO peeps (text) VALUES ('Covfefe')")
      con.exec("INSERT INTO peeps (text) VALUES ('First Peep :)')")
      con.exec("INSERT INTO peeps (text) VALUES ('Very stable genius')")
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
