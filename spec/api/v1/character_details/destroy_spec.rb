require "rails_helper"

RSpec.describe "character_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/character_details/#{character_detail.id}"
  end

  describe "basic destroy" do
    let!(:character_detail) { create(:character_detail) }

    it "updates the resource" do
      expect(CharacterDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CharacterDetail.count }.by(-1)
      expect { character_detail.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
