require "rails_helper"

RSpec.describe "character_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/character_details/#{character_detail.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:character_detail) { create(:character_detail) }

    it "works" do
      expect(CharacterDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("character_details")
      expect(d.id).to eq(character_detail.id)
    end
  end
end
