class UserDetailsController < ApplicationController
  before_action :set_user_detail, only: %i[show edit update destroy]

  def index
    @q = UserDetail.ransack(params[:q])
    @user_details = @q.result(distinct: true).includes(:bookmark_statuses,
                                                       :review_details, :movies_bookmarks, :movies_reviews).page(params[:page]).per(10)
  end

  def show
    @review_detail = ReviewDetail.new
    @bookmark_status = BookmarkStatus.new
  end

  def new
    @user_detail = UserDetail.new
  end

  def edit; end

  def create
    @user_detail = UserDetail.new(user_detail_params)

    if @user_detail.save
      redirect_to @user_detail, notice: "User detail was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_detail.update(user_detail_params)
      redirect_to @user_detail, notice: "User detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_detail.destroy
    redirect_to user_details_url,
                notice: "User detail was successfully destroyed."
  end

  private

  def set_user_detail
    @user_detail = UserDetail.find(params[:id])
  end

  def user_detail_params
    params.require(:user_detail).permit(:user_email, :username, :password)
  end
end
