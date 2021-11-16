class Api::V1::ActorDetailsController < Api::V1::GraphitiController
  def index
    actor_details = ActorDetailResource.all(params)
    respond_with(actor_details)
  end

  def show
    actor_detail = ActorDetailResource.find(params)
    respond_with(actor_detail)
  end

  def create
    actor_detail = ActorDetailResource.build(params)

    if actor_detail.save
      render jsonapi: actor_detail, status: :created
    else
      render jsonapi_errors: actor_detail
    end
  end

  def update
    actor_detail = ActorDetailResource.find(params)

    if actor_detail.update_attributes
      render jsonapi: actor_detail
    else
      render jsonapi_errors: actor_detail
    end
  end

  def destroy
    actor_detail = ActorDetailResource.find(params)

    if actor_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: actor_detail
    end
  end
end
