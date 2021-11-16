require 'rails_helper'

RSpec.describe "actor_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/actor_details/#{actor_detail.id}", payload
  end

  describe 'basic update' do
    let!(:actor_detail) { create(:actor_detail) }

    let(:payload) do
      {
        data: {
          id: actor_detail.id.to_s,
          type: 'actor_details',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ActorDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { actor_detail.reload.attributes }
    end
  end
end
