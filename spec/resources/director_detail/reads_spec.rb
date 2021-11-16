require "rails_helper"

RSpec.describe DirectorDetailResource, type: :resource do
  describe "serialization" do
    let!(:director_detail) { create(:director_detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(director_detail.id)
      expect(data.jsonapi_type).to eq("director_details")
    end
  end

  describe "filtering" do
    let!(:director_detail1) { create(:director_detail) }
    let!(:director_detail2) { create(:director_detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: director_detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([director_detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:director_detail1) { create(:director_detail) }
      let!(:director_detail2) { create(:director_detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      director_detail1.id,
                                      director_detail2.id,
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
                                      director_detail2.id,
                                      director_detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
