require 'rails_helper'

RSpec.describe "bookmark_statuses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/bookmark_statuses", payload
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
          type: 'bookmark_statuses',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BookmarkStatusResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { BookmarkStatus.count }.by(1)
    end
  end
end
