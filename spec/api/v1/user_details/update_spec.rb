require 'rails_helper'

RSpec.describe "user_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_details/#{user_detail.id}", payload
  end

  describe 'basic update' do
    let!(:user_detail) { create(:user_detail) }

    let(:payload) do
      {
        data: {
          id: user_detail.id.to_s,
          type: 'user_details',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(UserDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { user_detail.reload.attributes }
    end
  end
end
