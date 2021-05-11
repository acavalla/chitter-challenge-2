require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peeps = Peep.all
    'Peeps'
  end

  run! if app_file == $0
end
