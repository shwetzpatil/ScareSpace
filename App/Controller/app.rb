require 'sinatra/base'


class ScareSpace < Sinatra::Base
  enable :sessions
  get '/homepage' do
    erb :homepage
    # "Welcome to ScareSpace"
  end

  get '/' do
    "ScareSpace"
  end


  run! if app_file == $0
end
