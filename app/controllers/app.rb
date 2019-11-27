require_relative '../../config/environment'

class App < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, "password_security"
  end
  
  get '/' do 
    @coffees = Coffee.all 
    erb :index
  end 

  get '/login' do 
    erb :login 
  end 

  post '/login' do 
    if params[:username].empty? || params[:password].empty?
      redirect to '/index'
    end 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/coffee'
    else 
      redirect '/signup'
    end 
  end 

  get '/signup' do 
    erb :signup 
  end 

  get '/coffee' do 
    @user = User.find(session[:user_id])
    erb :coffee
  end 

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
