require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require 'pg'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/peeps' do
    Peep.create(text: params['peep'])
    redirect '/peeps'
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params['id'])
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
