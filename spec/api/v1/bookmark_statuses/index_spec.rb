require 'rails_helper'

RSpec.describe "bookmark_statuses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bookmark_statuses", params: params
  end

  describe 'basic fetch' do
    let!(:bookmark_status1) { create(:bookmark_status) }
    let!(:bookmark_status2) { create(:bookmark_status) }

    it 'works' do
      expect(BookmarkStatusResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['bookmark_statuses'])
      expect(d.map(&:id)).to match_array([bookmark_status1.id, bookmark_status2.id])
    end
  end
end
