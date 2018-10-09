require 'sinatra/base'
require './App/Model/User.rb'
require './App/Model/Database_Connection.rb'


class ScareSpace < Sinatra::Base
  enable :sessions

  get '/' do
    redirect('/homepage')
  end

  get '/homepage' do
    @user = User.find(id: session[:user_id])
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/homepage'
  end

  get '/spaces' do
    erb :spaces
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/homepage'
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
