require 'sinatra/base'


class ScareSpace < Sinatra::Base
  enable :sessions

  get '/' do
    redirect('/homepage')
  end
  
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

  post '/logout' do
    session.clear
    redirect('/homepage')
  end





  run! if app_file == $0
end
