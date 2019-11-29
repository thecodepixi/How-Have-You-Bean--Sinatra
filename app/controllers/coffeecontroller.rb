class CoffeeController < ApplicationController 


  get '/coffee' do 
    if logged_in? 
      @user = User.find(session[:user_id])
    end 
    @coffees = Coffee.all 
    erb :coffee
  end 

end 