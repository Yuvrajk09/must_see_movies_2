class Api::V1::UserDetailsController < Api::V1::GraphitiController
  def index
    user_details = UserDetailResource.all(params)
    respond_with(user_details)
  end

  def show
    user_detail = UserDetailResource.find(params)
    respond_with(user_detail)
  end

  def create
    user_detail = UserDetailResource.build(params)

    if user_detail.save
      render jsonapi: user_detail, status: :created
    else
      render jsonapi_errors: user_detail
    end
  end

  def update
    user_detail = UserDetailResource.find(params)

    if user_detail.update_attributes
      render jsonapi: user_detail
    else
      render jsonapi_errors: user_detail
    end
  end

  def destroy
    user_detail = UserDetailResource.find(params)

    if user_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_detail
    end
  end
end
