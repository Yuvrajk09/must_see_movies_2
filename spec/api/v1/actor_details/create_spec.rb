require 'rails_helper'

RSpec.describe "actor_details#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/actor_details", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'actor_details',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ActorDetailResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ActorDetail.count }.by(1)
    end
  end
end
