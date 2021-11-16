require "rails_helper"

RSpec.describe ReviewDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "review_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ReviewDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ReviewDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:review_detail) { create(:review_detail) }

    let(:payload) do
      {
        data: {
          id: review_detail.id.to_s,
          type: "review_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ReviewDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { review_detail.reload.updated_at }
      # .and change { review_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:review_detail) { create(:review_detail) }

    let(:instance) do
      ReviewDetailResource.find(id: review_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ReviewDetail.count }.by(-1)
    end
  end
end
