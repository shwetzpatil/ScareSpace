require 'sinatra/base'


class ScareSpace < Sinatra::Base
  enable :sessions
  get '/homepage' do
    erb :homepage
    # "Welcome to ScareSpace"
  end

  get '/signup' do
    erb :signup
  end

  get '/spaces' do
    erb :spaces
  end

  get '/login' do
    erb :login
  end

  get '/requests' do
    erb :requests
  end
  

  get '/' do
    "ScareSpace"
  end


  run! if app_file == $0
end
