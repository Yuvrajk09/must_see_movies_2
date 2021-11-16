class ActorDetailsController < ApplicationController
  before_action :set_actor_detail, only: [:show, :edit, :update, :destroy]

  # GET /actor_details
  def index
    @actor_details = ActorDetail.all
  end

  # GET /actor_details/1
  def show
  end

  # GET /actor_details/new
  def new
    @actor_detail = ActorDetail.new
  end

  # GET /actor_details/1/edit
  def edit
  end

  # POST /actor_details
  def create
    @actor_detail = ActorDetail.new(actor_detail_params)

    if @actor_detail.save
      redirect_to @actor_detail, notice: 'Actor detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /actor_details/1
  def update
    if @actor_detail.update(actor_detail_params)
      redirect_to @actor_detail, notice: 'Actor detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /actor_details/1
  def destroy
    @actor_detail.destroy
    redirect_to actor_details_url, notice: 'Actor detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_detail
      @actor_detail = ActorDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def actor_detail_params
      params.require(:actor_detail).permit(:actor_id, :actor_name, :actor_dob, :actor_bio, :actor_image)
    end
end