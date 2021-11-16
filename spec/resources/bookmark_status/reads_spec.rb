require "rails_helper"

RSpec.describe BookmarkStatusResource, type: :resource do
  describe "serialization" do
    let!(:bookmark_status) { create(:bookmark_status) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(bookmark_status.id)
      expect(data.jsonapi_type).to eq("bookmark_statuses")
    end
  end

  describe "filtering" do
    let!(:bookmark_status1) { create(:bookmark_status) }
    let!(:bookmark_status2) { create(:bookmark_status) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: bookmark_status2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([bookmark_status2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:bookmark_status1) { create(:bookmark_status) }
      let!(:bookmark_status2) { create(:bookmark_status) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      bookmark_status1.id,
                                      bookmark_status2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      bookmark_status2.id,
                                      bookmark_status1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
