class BookmarkStatusesController < ApplicationController
  before_action :set_bookmark_status, only: %i[show edit update destroy]

  def index
    @q = BookmarkStatus.ransack(params[:q])
    @bookmark_statuses = @q.result(distinct: true).includes(:bookmark,
                                                            :movie).page(params[:page]).per(10)
  end

  def show; end

  def new
    @bookmark_status = BookmarkStatus.new
  end

  def edit; end

  def create
    @bookmark_status = BookmarkStatus.new(bookmark_status_params)

    if @bookmark_status.save
      message = "BookmarkStatus was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @bookmark_status, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @bookmark_status.update(bookmark_status_params)
      redirect_to @bookmark_status,
                  notice: "Bookmark status was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @bookmark_status.destroy
    message = "BookmarkStatus was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to bookmark_statuses_url, notice: message
    end
  end

  private

  def set_bookmark_status
    @bookmark_status = BookmarkStatus.find(params[:id])
  end

  def bookmark_status_params
    params.require(:bookmark_status).permit(:bookmark_id, :bookmark_status)
  end
end
