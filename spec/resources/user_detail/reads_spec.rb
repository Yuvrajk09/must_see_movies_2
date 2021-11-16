require "rails_helper"

RSpec.describe UserDetailResource, type: :resource do
  describe "serialization" do
    let!(:user_detail) { create(:user_detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_detail.id)
      expect(data.jsonapi_type).to eq("user_details")
    end
  end

  describe "filtering" do
    let!(:user_detail1) { create(:user_detail) }
    let!(:user_detail2) { create(:user_detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_detail1) { create(:user_detail) }
      let!(:user_detail2) { create(:user_detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_detail1.id,
                                      user_detail2.id,
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
                                      user_detail2.id,
                                      user_detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
