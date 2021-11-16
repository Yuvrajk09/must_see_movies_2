class Api::V1::DirectorDetailsController < Api::V1::GraphitiController
  def index
    director_details = DirectorDetailResource.all(params)
    respond_with(director_details)
  end

  def show
    director_detail = DirectorDetailResource.find(params)
    respond_with(director_detail)
  end

  def create
    director_detail = DirectorDetailResource.build(params)

    if director_detail.save
      render jsonapi: director_detail, status: :created
    else
      render jsonapi_errors: director_detail
    end
  end

  def update
    director_detail = DirectorDetailResource.find(params)

    if director_detail.update_attributes
      render jsonapi: director_detail
    else
      render jsonapi_errors: director_detail
    end
  end

  def destroy
    director_detail = DirectorDetailResource.find(params)

    if director_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: director_detail
    end
  end
end
