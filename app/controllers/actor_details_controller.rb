class ActorDetailsController < ApplicationController
  before_action :set_actor_detail, only: %i[show edit update destroy]

  def index
    @q = ActorDetail.ransack(params[:q])
    @actor_details = @q.result(distinct: true).includes(:character_details,
                                                        :movies).page(params[:page]).per(10)
  end

  def show
    @character_detail = CharacterDetail.new
  end

  def new
    @actor_detail = ActorDetail.new
  end

  def edit; end

  def create
    @actor_detail = ActorDetail.new(actor_detail_params)

    if @actor_detail.save
      redirect_to @actor_detail,
                  notice: "Actor detail was successfully created."
    else
      render :new
    end
  end

  def update
    if @actor_detail.update(actor_detail_params)
      redirect_to @actor_detail,
                  notice: "Actor detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @actor_detail.destroy
    redirect_to actor_details_url,
                notice: "Actor detail was successfully destroyed."
  end

  private

  def set_actor_detail
    @actor_detail = ActorDetail.find(params[:id])
  end

  def actor_detail_params
    params.require(:actor_detail).permit(:actor_id, :actor_name, :actor_dob,
                                         :actor_bio, :actor_image)
  end
end
