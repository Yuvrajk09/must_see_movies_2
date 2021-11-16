class Api::V1::CharacterDetailsController < Api::V1::GraphitiController
  def index
    character_details = CharacterDetailResource.all(params)
    respond_with(character_details)
  end

  def show
    character_detail = CharacterDetailResource.find(params)
    respond_with(character_detail)
  end

  def create
    character_detail = CharacterDetailResource.build(params)

    if character_detail.save
      render jsonapi: character_detail, status: :created
    else
      render jsonapi_errors: character_detail
    end
  end

  def update
    character_detail = CharacterDetailResource.find(params)

    if character_detail.update_attributes
      render jsonapi: character_detail
    else
      render jsonapi_errors: character_detail
    end
  end

  def destroy
    character_detail = CharacterDetailResource.find(params)

    if character_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: character_detail
    end
  end
end
