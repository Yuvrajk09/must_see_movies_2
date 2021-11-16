class BookmarkStatusesController < ApplicationController
  before_action :set_bookmark_status, only: [:show, :edit, :update, :destroy]

  # GET /bookmark_statuses
  def index
    @bookmark_statuses = BookmarkStatus.all
  end

  # GET /bookmark_statuses/1
  def show
  end

  # GET /bookmark_statuses/new
  def new
    @bookmark_status = BookmarkStatus.new
  end

  # GET /bookmark_statuses/1/edit
  def edit
  end

  # POST /bookmark_statuses
  def create
    @bookmark_status = BookmarkStatus.new(bookmark_status_params)

    if @bookmark_status.save
      redirect_to @bookmark_status, notice: 'Bookmark status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookmark_statuses/1
  def update
    if @bookmark_status.update(bookmark_status_params)
      redirect_to @bookmark_status, notice: 'Bookmark status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookmark_statuses/1
  def destroy
    @bookmark_status.destroy
    redirect_to bookmark_statuses_url, notice: 'Bookmark status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark_status
      @bookmark_status = BookmarkStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookmark_status_params
      params.require(:bookmark_status).permit(:bookmark_id, :bookmark_status)
    end
end
