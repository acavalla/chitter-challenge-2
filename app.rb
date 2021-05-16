require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  post '/peeps' do
    Peep.create(text: params['peep'])
    redirect '/peeps'
  end

  # delete '/peeps' do
  #   Peep.delete(text: params['id'])
  #   redirect '/peeps'
  # end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
