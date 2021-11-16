class ReviewDetailsController < ApplicationController
  before_action :set_review_detail, only: %i[show edit update destroy]

  def index
    @q = ReviewDetail.ransack(params[:q])
    @review_details = @q.result(distinct: true).includes(:user,
                                                         :movie).page(params[:page]).per(10)
  end

  def show; end

  def new
    @review_detail = ReviewDetail.new
  end

  def edit; end

  def create
    @review_detail = ReviewDetail.new(review_detail_params)

    if @review_detail.save
      message = "ReviewDetail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @review_detail, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @review_detail.update(review_detail_params)
      redirect_to @review_detail,
                  notice: "Review detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review_detail.destroy
    message = "ReviewDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to review_details_url, notice: message
    end
  end

  private

  def set_review_detail
    @review_detail = ReviewDetail.find(params[:id])
  end

  def review_detail_params
    params.require(:review_detail).permit(:movie_id, :review, :star_ratings,
                                          :user_id)
  end
end
