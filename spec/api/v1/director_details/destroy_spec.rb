require 'rails_helper'

RSpec.describe "director_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/director_details/#{director_detail.id}"
  end

  describe 'basic destroy' do
    let!(:director_detail) { create(:director_detail) }

    it 'updates the resource' do
      expect(DirectorDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { DirectorDetail.count }.by(-1)
      expect { director_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
