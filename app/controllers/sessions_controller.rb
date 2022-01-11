class SessionsController < ApplicationController
	def new
  end

   def create
    # calling method defined in user contoller
    user = User.authenticate_with_credentials(params[:email], params[:password])
   
      # Save the user id inside the browser cookie. 
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      # flash.now.alert = "Email or password is invalid"
      flash[:alert] = "Email or password is invalid"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
