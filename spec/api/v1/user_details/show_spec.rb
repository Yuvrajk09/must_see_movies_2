require "rails_helper"

RSpec.describe "user_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_details/#{user_detail.id}", params: params
  end

  describe "basic fetch" do
    let!(:user_detail) { create(:user_detail) }

    it "works" do
      expect(UserDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("user_details")
      expect(d.id).to eq(user_detail.id)
    end
  end
end
