class SessionsController < ApplicationController
	def new
  end

  def create
   
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if(user)
      # Save the user id inside the browser cookie. 
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      # flash.now.alert = "Email or password is invalid"
      flash.now[:alert] = "Email or password is invalid"
      # puts "...............hi................"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
