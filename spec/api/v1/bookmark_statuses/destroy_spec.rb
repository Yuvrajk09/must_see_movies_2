require "rails_helper"

RSpec.describe "bookmark_statuses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/bookmark_statuses/#{bookmark_status.id}"
  end

  describe "basic destroy" do
    let!(:bookmark_status) { create(:bookmark_status) }

    it "updates the resource" do
      expect(BookmarkStatusResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { BookmarkStatus.count }.by(-1)
      expect { bookmark_status.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
