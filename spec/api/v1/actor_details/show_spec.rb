require "rails_helper"

RSpec.describe "actor_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/actor_details/#{actor_detail.id}", params: params
  end

  describe "basic fetch" do
    let!(:actor_detail) { create(:actor_detail) }

    it "works" do
      expect(ActorDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("actor_details")
      expect(d.id).to eq(actor_detail.id)
    end
  end
end
