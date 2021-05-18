require 'database_helpers'
require './lib/user'

describe User do
  describe '.create' do
    it 'creates an instance of user in the database' do
      user = User.create(email: 'acav@gmail.com', password: 'password')
      persisted_data = persisted_data(table: 'users', id: user.id)
      expect(user.id).to eq persisted_data['id']
      expect(user).to be_a User
      expect(persisted_data['email']).to eq 'acav@gmail.com'
    end

    it 'encrypts the password' do
      expect(BCrypt::Password).to receive(:create).with('password')

      User.create(email:'acav@gmail.com', password: 'password')
    end
  end

  describe '.find' do
    it 'finds nil if no session id' do
      expect(User.find(nil)).to eq nil
    end
    it 'finds a user from their id' do
      user = User.create(email: 'acav@gmail.com', password: 'password')
      user2 = User.find(user.id)
      expect(user2.email).to eq 'acav@gmail.com'
    end
  end

  describe 'authenticate' do
    before(:each) do
      User.create(email: 'acav@gmail.com', password: 'password9')
    end

    it 'returns a User if correct' do
      expect(User.authenticate(email: 'acav@gmail.com', password: 'password9')).to be_a(User)
    end

    it 'returns nil if wrong email' do
      expect(User.authenticate(email: 'acav@gnail.com', password: 'password9')).to be_nil
    end

    it 'returns nil if wrong password' do
      expect(User.authenticate(email: 'acav@gmail.com', password: 'pastaword')).to be_nil
    end
  end
end
