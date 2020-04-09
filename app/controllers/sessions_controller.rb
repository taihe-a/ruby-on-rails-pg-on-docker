class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = User.find_by(email: session_params[:email])
  end
  
  def destory
    
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
  
end
