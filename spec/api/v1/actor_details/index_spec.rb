require 'rails_helper'

RSpec.describe "actor_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/actor_details", params: params
  end

  describe 'basic fetch' do
    let!(:actor_detail1) { create(:actor_detail) }
    let!(:actor_detail2) { create(:actor_detail) }

    it 'works' do
      expect(ActorDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['actor_details'])
      expect(d.map(&:id)).to match_array([actor_detail1.id, actor_detail2.id])
    end
  end
end
