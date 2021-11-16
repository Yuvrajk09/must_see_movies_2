require 'rails_helper'

RSpec.describe "review_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/review_details", params: params
  end

  describe 'basic fetch' do
    let!(:review_detail1) { create(:review_detail) }
    let!(:review_detail2) { create(:review_detail) }

    it 'works' do
      expect(ReviewDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['review_details'])
      expect(d.map(&:id)).to match_array([review_detail1.id, review_detail2.id])
    end
  end
end
