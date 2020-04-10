class SessionsController < ApplicationController
  def new
  end

  def create
    
    binding.pry
    
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "ログインしました"
    else
      render action: :new
    end
  end
  
  def destory
    
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
  
end