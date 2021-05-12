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
      con = PG.connect(dbname: 'chitter_test')
      con.exec("INSERT INTO peeps (text) VALUES ('Covfefe')")
      con.exec("INSERT INTO peeps (text) VALUES ('First Peep :)')")
      con.exec("INSERT INTO peeps (text) VALUES ('Very stable genius')")
      peeps = Peep.all
      expect(peeps[0]).to include 'Covfefe'
      # expect(peeps[1]).to include '2021-05-12 11:59:45'
      expect(peeps[1]).to include 'First Peep :)'
      expect(peeps[2]).to include 'Very stable genius'
    end
  end

  describe '.create' do
    it 'creates a new Peep in the database' do
      Peep.create(text: 'Try to create')
      peeps = Peep.all
      expect(peeps[0]).to include 'Try to create'
    end
  end
end
