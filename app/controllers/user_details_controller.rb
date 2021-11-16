class UserDetailsController < ApplicationController
  before_action :set_user_detail, only: [:show, :edit, :update, :destroy]

  # GET /user_details
  def index
    @user_details = UserDetail.all
  end

  # GET /user_details/1
  def show
    @movie = Movie.new
  end

  # GET /user_details/new
  def new
    @user_detail = UserDetail.new
  end

  # GET /user_details/1/edit
  def edit
  end

  # POST /user_details
  def create
    @user_detail = UserDetail.new(user_detail_params)

    if @user_detail.save
      redirect_to @user_detail, notice: 'User detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_details/1
  def update
    if @user_detail.update(user_detail_params)
      redirect_to @user_detail, notice: 'User detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_details/1
  def destroy
    @user_detail.destroy
    redirect_to user_details_url, notice: 'User detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_detail
      @user_detail = UserDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_detail_params
      params.require(:user_detail).permit(:user_email, :user_id, :username, :password)
    end
end
