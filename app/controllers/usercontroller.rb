class UserController < ApplicationController

  get '/' do 
    redirect '/coffees'
  end 

  get '/login' do 
    if logged_in? 
      redirect '/coffees'
    end 
    erb :login 
  end 

  post '/login' do 
    if params[:username].empty? || params[:password].empty?
      redirect to '/index'
    end 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/coffees'
    else 
      redirect '/signup'
    end 
  end 

  get '/signup' do 
    if logged_in? 
      redirect '/' 
    end 
    erb :signup 
  end 

  post '/signup' do 
    if params[:username].empty? || params[:password].empty? 
      redirect '/signup'
    end 

    user = User.create(params)
    session[:user_id] = user.id 
    redirect '/coffees'
  end 

  get '/logout' do 
    session.clear 
    redirect '/'
  end 

end
