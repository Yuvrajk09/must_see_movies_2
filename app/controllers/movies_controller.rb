class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true).includes(:review_details,
                                                 :bookmark_statuses, :character_details, :director, :actors, :users, :users_reviews).page(params[:page]).per(10)
  end

  def show
    @character_detail = CharacterDetail.new
    @bookmark_status = BookmarkStatus.new
    @review_detail = ReviewDetail.new
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      message = "Movie was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @movie, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    message = "Movie was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to movies_url, notice: message
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:user_id, :movie_name, :movie_description,
                                  :movie_duration, :movie_year, :movie_image, :director_id)
  end
end
