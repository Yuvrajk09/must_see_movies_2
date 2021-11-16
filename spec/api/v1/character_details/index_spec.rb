require "rails_helper"

RSpec.describe "character_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/character_details", params: params
  end

  describe "basic fetch" do
    let!(:character_detail1) { create(:character_detail) }
    let!(:character_detail2) { create(:character_detail) }

    it "works" do
      expect(CharacterDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["character_details"])
      expect(d.map(&:id)).to match_array([character_detail1.id,
                                          character_detail2.id])
    end
  end
end
