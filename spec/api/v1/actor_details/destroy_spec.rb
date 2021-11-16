require 'rails_helper'

RSpec.describe "actor_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/actor_details/#{actor_detail.id}"
  end

  describe 'basic destroy' do
    let!(:actor_detail) { create(:actor_detail) }

    it 'updates the resource' do
      expect(ActorDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ActorDetail.count }.by(-1)
      expect { actor_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
