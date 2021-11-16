class CharacterDetailsController < ApplicationController
  before_action :set_character_detail, only: %i[show edit update destroy]

  def index
    @q = CharacterDetail.ransack(params[:q])
    @character_details = @q.result(distinct: true).includes(:movie,
                                                            :actor).page(params[:page]).per(10)
  end

  def show; end

  def new
    @character_detail = CharacterDetail.new
  end

  def edit; end

  def create
    @character_detail = CharacterDetail.new(character_detail_params)

    if @character_detail.save
      message = "CharacterDetail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @character_detail, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @character_detail.update(character_detail_params)
      redirect_to @character_detail,
                  notice: "Character detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @character_detail.destroy
    message = "CharacterDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to character_details_url, notice: message
    end
  end

  private

  def set_character_detail
    @character_detail = CharacterDetail.find(params[:id])
  end

  def character_detail_params
    params.require(:character_detail).permit(:movie_id, :actor_id,
                                             :character_name)
  end
end
