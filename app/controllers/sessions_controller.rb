class SessionsController < ApplicationController
  def new
    # redirect_to sessions_create_path
    puts "**** Entering in Sessions#new ****"
  end

  def create
    puts "**** Entering in Sessions#create ****"
    session_params
    my_user = User.find_by(email: params[:my_email])

    if my_user && my_user.authenticate(params[:my_password])
      session[:user_id] = my_user.id
      session[:admin] = User.find_by(id:session[:user_id]).is_admin
      redirect_to gossips_path, notice: "Your are now connected to TGP. Glad to see you, #{my_user.first_name} !"
    else
      flash[:danger] = "Invalid email/password combination"
      render sessions_new_path
    end
  end

  def delete
    session[:user_id] = nil
    session[:admin] = nil
    puts "**** Entering in Sessions#delete ****"
    redirect_to gossips_path, notice: "Your were successfully logged out from TGP. See You later!"
  end

  # Private section
  private
    
    # Use callbacks (see head of file) to share common setup or constraints between actions.
    def set_session
      
    end

    # Only allow a list of trusted parameters through.
    def session_params
      puts "*** TGP says: matching 'params' content for 'section' with known structure / content to avoid any injection ***"
      params.permit(:my_email, :my_password, :authenticity_token)
      puts"*** Params a cette tête-là: #{params} ***"
    end

end
