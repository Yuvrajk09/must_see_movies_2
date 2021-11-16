require 'rails_helper'

RSpec.describe "bookmark_statuses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/bookmark_statuses/#{bookmark_status.id}", payload
  end

  describe 'basic update' do
    let!(:bookmark_status) { create(:bookmark_status) }

    let(:payload) do
      {
        data: {
          id: bookmark_status.id.to_s,
          type: 'bookmark_statuses',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BookmarkStatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { bookmark_status.reload.attributes }
    end
  end
end
