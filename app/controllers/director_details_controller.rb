class DirectorDetailsController < ApplicationController
  before_action :set_director_detail, only: %i[show edit update destroy]

  def index
    @q = DirectorDetail.ransack(params[:q])
    @director_details = @q.result(distinct: true).includes(:movies).page(params[:page]).per(10)
  end

  def show
    @movie = Movie.new
  end

  def new
    @director_detail = DirectorDetail.new
  end

  def edit; end

  def create
    @director_detail = DirectorDetail.new(director_detail_params)

    if @director_detail.save
      redirect_to @director_detail,
                  notice: "Director detail was successfully created."
    else
      render :new
    end
  end

  def update
    if @director_detail.update(director_detail_params)
      redirect_to @director_detail,
                  notice: "Director detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @director_detail.destroy
    redirect_to director_details_url,
                notice: "Director detail was successfully destroyed."
  end

  private

  def set_director_detail
    @director_detail = DirectorDetail.find(params[:id])
  end

  def director_detail_params
    params.require(:director_detail).permit(:director_id, :director_name,
                                            :director_dob, :director_bio, :director_image)
  end
end
