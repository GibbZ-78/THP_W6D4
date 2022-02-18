class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    user_params
    @user = User.new(first_name: params[:my_first_name],
                     last_name: params[:my_last_name],
                     nickname: params[:my_nickname],
                     email: params[:my_email],
                     gender: params[:my_genre],
                     birthdate: params[:my_birthdate].to_date,
                     age: Date.today.year.to_i - params[:my_birthdate].to_date.year.to_i,
                     is_adult: (Date.today.year.to_i - params[:my_birthdate].to_date.year.to_i) >= 18,
                     is_admin: false,
                     city_id: params[:my_city_id],
                     password: params[:my_password])

    respond_to do |format|
      if @user.save
        format.html { redirect_to gossip_path, notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    # @user.destroy

    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:my_first_name, :my_last_name, :my_nickname, :my_email, :my_password, :my_gender, :my_birthdate, :my_city_id, :authenticity_token)
    end
end
