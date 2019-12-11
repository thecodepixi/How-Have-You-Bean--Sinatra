require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    set :public_folder, Proc.new { File.join(root, "../public/") }
    enable :sessions
    set :session_secret, "coffee_is_life"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id])
    end

    def validate_user
      if /[;'{}()]/.match?(params[:username])
        raise ArgumentError.new('Invalid special characters detected in username')
      elsif /[;'{}()]/.match?(params[:password])
        raise ArgumentError.new('Invalid special characters detected in password')
      end 
    end 

  end

end 