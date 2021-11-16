class DirectorDetailsController < ApplicationController
  before_action :set_director_detail, only: [:show, :edit, :update, :destroy]

  # GET /director_details
  def index
    @director_details = DirectorDetail.all
  end

  # GET /director_details/1
  def show
  end

  # GET /director_details/new
  def new
    @director_detail = DirectorDetail.new
  end

  # GET /director_details/1/edit
  def edit
  end

  # POST /director_details
  def create
    @director_detail = DirectorDetail.new(director_detail_params)

    if @director_detail.save
      redirect_to @director_detail, notice: 'Director detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /director_details/1
  def update
    if @director_detail.update(director_detail_params)
      redirect_to @director_detail, notice: 'Director detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /director_details/1
  def destroy
    @director_detail.destroy
    redirect_to director_details_url, notice: 'Director detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_director_detail
      @director_detail = DirectorDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def director_detail_params
      params.require(:director_detail).permit(:director_id, :director_name, :director_dob, :director_bio, :director_image)
    end
end
