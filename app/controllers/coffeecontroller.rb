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
    coffee= Coffee.new(params[:coffee])
    @user.coffees << coffee
    redirect '/coffees'
  end 

  get '/coffees/user/:id' do 
    @user = User.find(params[:id]) 
    @coffees = Coffee.where(:user_id == @user.id).order(rating: :desc)
    
    erb :user_coffees 
  end 

  get '/coffees/:id' do 
    @coffee = Coffee.find(params[:id]) 

    erb :single 
  end 

  get '/coffees/:id/edit' do 
    @coffee = Coffee.find(params[:id])
    if @coffee.user_id != session[:user_id] 
      redirect '/login' 
    end 

    erb :edit
  end 

  patch '/coffees/:id' do 
    @coffee = Coffee.find(params[:id]) 

    @coffee.update(params[:coffee])
    redirect "/coffees/#{@coffee.id}"
  end 

  get '/coffees/roaster/:roaster' do 
    @roaster = params[:roaster].split("-").join(" ").titleize 
    @coffees = Coffee.where(roaster: @roaster)

    erb :roaster
  end 

  delete '/coffees/:id/delete' do 
    @coffee = Coffee.find(params[:id]) 
    if @coffee.user_id != session[:user_id] 
      redirect '/login'
    end 
    @coffee.delete 

    redirect "/coffees/user/#{session[:user_id]}"
  end 

end 