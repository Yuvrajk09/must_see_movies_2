require "rails_helper"

RSpec.describe "director_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/director_details/#{director_detail.id}", payload
  end

  describe "basic update" do
    let!(:director_detail) { create(:director_detail) }

    let(:payload) do
      {
        data: {
          id: director_detail.id.to_s,
          type: "director_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DirectorDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { director_detail.reload.attributes }
    end
  end
end
