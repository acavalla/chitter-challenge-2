require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require 'pg'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

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
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'You already have an account. Please sign in'
      redirect '/users/new'
    end
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

  get '/session/new' do
    erb :'session/new'
  end

  post '/session' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Incorrect credentials.'
      redirect '/session/new'
    end
  end

  run! if app_file == $0
end
