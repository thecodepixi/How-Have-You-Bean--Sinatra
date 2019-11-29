class CoffeeController < ApplicationController 

  get '/coffees' do 
    if logged_in? 
      @user = User.find(session[:user_id])
    end 
    @coffees = Coffee.all 
    erb :coffee
  end 

  get '/coffees/new' do 
    if !logged_in?
      redirect '/login'
    end 
    erb :new 
  end 

  post '/coffees/new' do 
    @user = User.find(session[:user_id])
    @coffee = Coffee.new(params[:coffee])
    redirect '/coffees'
  end 

  get '/coffees/user/:id' do 
    @user = User.find(params[:id]) 

    erb :user_coffees 
  end 

  get '/coffees/:id' do 
    @coffee = Coffee.find(params[:id]) 

    erb :single 
  end 

  get '/coffees/:id/edit' do 
    @coffee = Coffee.find(params[:id])

    erb :edit
  end 

end 