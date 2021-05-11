require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  get '/peeps' do
    peeps = [
      'Hi! First Peep',
      'Way better than Twitter',
      'Covfefe'
    ]
    peeps.join
  end

  run! if app_file == $0
end
