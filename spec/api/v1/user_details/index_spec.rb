require "rails_helper"

RSpec.describe "user_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_details", params: params
  end

  describe "basic fetch" do
    let!(:user_detail1) { create(:user_detail) }
    let!(:user_detail2) { create(:user_detail) }

    it "works" do
      expect(UserDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_details"])
      expect(d.map(&:id)).to match_array([user_detail1.id, user_detail2.id])
    end
  end
end
