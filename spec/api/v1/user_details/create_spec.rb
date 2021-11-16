require 'rails_helper'

RSpec.describe "user_details#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/user_details", payload
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
          type: 'user_details',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(UserDetailResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { UserDetail.count }.by(1)
    end
  end
end
