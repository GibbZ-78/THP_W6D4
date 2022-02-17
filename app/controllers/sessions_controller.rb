class SessionsController < ApplicationController
  def new
    # redirect_to sessions_create_path
    puts "**** Entering in Sessions#new ****"
  end

  def create
    puts "**** Entering in Sessions#create ****"
    my_user = User.find_by(email: params[:my_email])

    if my_user && my_user.authenticate(params[:my_password])
      session[:user_id] = my_user.id
      redirect_to gossips_path, notice: "Your are now connected to TGP. Glad to see you, #{my_user.first_name} !"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render sessions_new
    end
  end

  def delete
    session[:user_id] = nil
    puts "**** Entering in Sessions#delete ****"
    redirect_to gossips_path, notice: "Your were successfully logged out from TGP. See You later!"
  end
end
