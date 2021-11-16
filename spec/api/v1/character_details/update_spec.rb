require "rails_helper"

RSpec.describe "character_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/character_details/#{character_detail.id}", payload
  end

  describe "basic update" do
    let!(:character_detail) { create(:character_detail) }

    let(:payload) do
      {
        data: {
          id: character_detail.id.to_s,
          type: "character_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CharacterDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { character_detail.reload.attributes }
    end
  end
end
