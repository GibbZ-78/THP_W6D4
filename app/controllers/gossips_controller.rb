class GossipsController < ApplicationController
  # populate the @gossip var when firing action is within list
  before_action :set_gossip, only: %i[ show edit update destroy ]

  # GET /gossips
  def index
    # unless !session[:user_id].nil?
    #   flash[:danger] = "Please log in."
    #   puts "*** TGP says: Session token is null, user has to connect first ***"
    #   redirect_to sessions_new_path
    # else
      # puts "*** TGP says: Session token not null ***"
      puts "*** TGP says: displaying the list of all gossips (INDEX) ***"
      @gossips = Gossip.all
    # end
  end

  # GET /gossips/1
  def show
    puts "*** TGP says: displaying information for gossip nr. #{params[:id]} (SHOW) ***"
    @gossip = Gossip.find(params[:id])
  end

  # GET /gossips/new
  def new
    puts "*** TGP says: going through the 1 over 2 steps of the gossip creation (NEW) ***"
    @gossip = Gossip.new
  end

  # GET /gossips/1/edit
  def edit
    puts "*** TGP says: going through the step 1/2 of the edition of gossip nr. #{params[:id]} ***"
  end

  # POST /gossips
  def create
    puts "*** TGP says: going through the gossip creation method (CREATE) ***"
    @gossip = Gossip.new(gossip_params)
    respond_to do |format|
      if @gossip.save
        format.html { redirect_to gossip_url(@gossip), notice: "Gossip was successfully created (id: #{@gossip.id})." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gossips/1 or /gossips/1.json
  def update
    puts "*** TGP says: going through the 2nd step of gossip edition (UPDATE) ***"
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to gossip_url(@gossip), notice: "Gossip was successfully updated (id: #{@gossip.id})." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1 or /gossips/1.json
  def destroy
    puts "*** TGP says: going through single step of gossip erasement (DELETE) ***"
    tmp_id = @gossip.id
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to gossips_url, notice: "Gossip was successfully destroyed (id: #{tmp_id})." }
    end
  end

  # Private section
  private
    
    # Use callbacks (see head of file) to share common setup or constraints between actions.
    def set_gossip
      puts "*** TGP says: initializing @gossip thanks to the 'id' passed through the HTTP request ***"
      @gossip = Gossip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gossip_params
      puts "*** TGP says: matching 'params' content with known structure / content to avoid any injection ***"
      params.require(:gossip).permit(:title, :content, :user_id)
    end
end
