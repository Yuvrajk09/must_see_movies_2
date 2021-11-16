require "rails_helper"

RSpec.describe CharacterDetailResource, type: :resource do
  describe "serialization" do
    let!(:character_detail) { create(:character_detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(character_detail.id)
      expect(data.jsonapi_type).to eq("character_details")
    end
  end

  describe "filtering" do
    let!(:character_detail1) { create(:character_detail) }
    let!(:character_detail2) { create(:character_detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: character_detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([character_detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:character_detail1) { create(:character_detail) }
      let!(:character_detail2) { create(:character_detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      character_detail1.id,
                                      character_detail2.id,
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
                                      character_detail2.id,
                                      character_detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
