class ReviewDetailsController < ApplicationController
  before_action :set_review_detail, only: [:show, :edit, :update, :destroy]

  # GET /review_details
  def index
    @review_details = ReviewDetail.all
  end

  # GET /review_details/1
  def show
  end

  # GET /review_details/new
  def new
    @review_detail = ReviewDetail.new
  end

  # GET /review_details/1/edit
  def edit
  end

  # POST /review_details
  def create
    @review_detail = ReviewDetail.new(review_detail_params)

    if @review_detail.save
      redirect_to @review_detail, notice: 'Review detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /review_details/1
  def update
    if @review_detail.update(review_detail_params)
      redirect_to @review_detail, notice: 'Review detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /review_details/1
  def destroy
    @review_detail.destroy
    redirect_to review_details_url, notice: 'Review detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_detail
      @review_detail = ReviewDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_detail_params
      params.require(:review_detail).permit(:review_id, :review, :star_ratings)
    end
end
