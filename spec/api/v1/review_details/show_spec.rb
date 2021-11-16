require 'rails_helper'

RSpec.describe "review_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/review_details/#{review_detail.id}", params: params
  end

  describe 'basic fetch' do
    let!(:review_detail) { create(:review_detail) }

    it 'works' do
      expect(ReviewDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('review_details')
      expect(d.id).to eq(review_detail.id)
    end
  end
end
