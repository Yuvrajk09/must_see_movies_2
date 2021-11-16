require 'rails_helper'

RSpec.describe "director_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/director_details", params: params
  end

  describe 'basic fetch' do
    let!(:director_detail1) { create(:director_detail) }
    let!(:director_detail2) { create(:director_detail) }

    it 'works' do
      expect(DirectorDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['director_details'])
      expect(d.map(&:id)).to match_array([director_detail1.id, director_detail2.id])
    end
  end
end
