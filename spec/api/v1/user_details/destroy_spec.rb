require "rails_helper"

RSpec.describe "user_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_details/#{user_detail.id}"
  end

  describe "basic destroy" do
    let!(:user_detail) { create(:user_detail) }

    it "updates the resource" do
      expect(UserDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UserDetail.count }.by(-1)
      expect { user_detail.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
