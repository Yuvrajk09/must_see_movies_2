require 'rails_helper'

RSpec.describe "bookmark_statuses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bookmark_statuses/#{bookmark_status.id}", params: params
  end

  describe 'basic fetch' do
    let!(:bookmark_status) { create(:bookmark_status) }

    it 'works' do
      expect(BookmarkStatusResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('bookmark_statuses')
      expect(d.id).to eq(bookmark_status.id)
    end
  end
end
