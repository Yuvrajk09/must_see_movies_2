class Api::V1::ReviewDetailsController < Api::V1::GraphitiController
  def index
    review_details = ReviewDetailResource.all(params)
    respond_with(review_details)
  end

  def show
    review_detail = ReviewDetailResource.find(params)
    respond_with(review_detail)
  end

  def create
    review_detail = ReviewDetailResource.build(params)

    if review_detail.save
      render jsonapi: review_detail, status: 201
    else
      render jsonapi_errors: review_detail
    end
  end

  def update
    review_detail = ReviewDetailResource.find(params)

    if review_detail.update_attributes
      render jsonapi: review_detail
    else
      render jsonapi_errors: review_detail
    end
  end

  def destroy
    review_detail = ReviewDetailResource.find(params)

    if review_detail.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: review_detail
    end
  end
end
