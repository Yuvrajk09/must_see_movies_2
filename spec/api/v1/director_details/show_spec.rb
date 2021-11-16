require "rails_helper"

RSpec.describe "director_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/director_details/#{director_detail.id}", params: params
  end

  describe "basic fetch" do
    let!(:director_detail) { create(:director_detail) }

    it "works" do
      expect(DirectorDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("director_details")
      expect(d.id).to eq(director_detail.id)
    end
  end
end
