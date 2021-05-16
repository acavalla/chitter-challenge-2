require './lib/database_connection'

describe DatabaseConnection do
  describe 'self.setup' do
    it 'saves its parameter to a class instance variable' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe 'self.connection' do
    it 'persists the connection' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
