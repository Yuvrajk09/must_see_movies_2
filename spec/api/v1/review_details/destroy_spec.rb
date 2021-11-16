require "rails_helper"

RSpec.describe "review_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/review_details/#{review_detail.id}"
  end

  describe "basic destroy" do
    let!(:review_detail) { create(:review_detail) }

    it "updates the resource" do
      expect(ReviewDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ReviewDetail.count }.by(-1)
      expect { review_detail.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
