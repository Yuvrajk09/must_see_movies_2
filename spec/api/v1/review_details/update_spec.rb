require "rails_helper"

RSpec.describe "review_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/review_details/#{review_detail.id}", payload
  end

  describe "basic update" do
    let!(:review_detail) { create(:review_detail) }

    let(:payload) do
      {
        data: {
          id: review_detail.id.to_s,
          type: "review_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ReviewDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { review_detail.reload.attributes }
    end
  end
end
