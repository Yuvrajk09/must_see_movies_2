class Api::V1::BookmarkStatusesController < Api::V1::GraphitiController
  def index
    bookmark_statuses = BookmarkStatusResource.all(params)
    respond_with(bookmark_statuses)
  end

  def show
    bookmark_status = BookmarkStatusResource.find(params)
    respond_with(bookmark_status)
  end

  def create
    bookmark_status = BookmarkStatusResource.build(params)

    if bookmark_status.save
      render jsonapi: bookmark_status, status: 201
    else
      render jsonapi_errors: bookmark_status
    end
  end

  def update
    bookmark_status = BookmarkStatusResource.find(params)

    if bookmark_status.update_attributes
      render jsonapi: bookmark_status
    else
      render jsonapi_errors: bookmark_status
    end
  end

  def destroy
    bookmark_status = BookmarkStatusResource.find(params)

    if bookmark_status.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: bookmark_status
    end
  end
end
