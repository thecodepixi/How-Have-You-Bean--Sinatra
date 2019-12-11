class CoffeeController < ApplicationController 

  get '/coffees' do 
    if logged_in? 
      @user = current_user
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
    @user = current_user
    coffee = Coffee.new(params[:coffee])
    @user.coffees << coffee
    redirect "/coffees/user/#{@user.id}"
  end 

  get '/coffees/user/:id' do 
    @user = User.find(params[:id]) 
    @coffees = @user.coffees.order(rating: :desc)
    
    erb :user_coffees 
  end 

  get '/coffees/:id' do 
    @coffee = Coffee.find(params[:id]) 

    erb :single 
  end 

  get '/coffees/:id/edit' do 
    @coffee = Coffee.find(params[:id])
    if @coffee.user_id != current_user.id
      redirect '/login' 
    end 

    erb :edit
  end 

  patch '/coffees/:id' do 
    @coffee = Coffee.find(params[:id]) 

    @coffee.update(params[:coffee])
    redirect "/coffees/#{@coffee.id}"
  end 

  get '/coffees/roasters/:roaster' do 
    @roaster = params[:roaster].split("-").join(" ").downcase 
    @coffees = Coffee.all.select{|c| c.roaster.downcase == @roaster}

    erb :roaster
  end 

  delete '/coffees/:id/delete' do 
    @coffee = Coffee.find(params[:id]) 
    if @coffee.user_id != current_user.id
      redirect '/login'
    end 
    @coffee.delete 

    redirect "/coffees/user/#{current_user.id}"
  end 

end 