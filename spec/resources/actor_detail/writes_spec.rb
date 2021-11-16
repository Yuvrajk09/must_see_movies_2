require "rails_helper"

RSpec.describe ActorDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "actor_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActorDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ActorDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:actor_detail) { create(:actor_detail) }

    let(:payload) do
      {
        data: {
          id: actor_detail.id.to_s,
          type: "actor_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActorDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { actor_detail.reload.updated_at }
      # .and change { actor_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:actor_detail) { create(:actor_detail) }

    let(:instance) do
      ActorDetailResource.find(id: actor_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ActorDetail.count }.by(-1)
    end
  end
end
