require "rails_helper"

RSpec.describe UserDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "user_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UserDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UserDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:user_detail) { create(:user_detail) }

    let(:payload) do
      {
        data: {
          id: user_detail.id.to_s,
          type: "user_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UserDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { user_detail.reload.updated_at }
      # .and change { user_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:user_detail) { create(:user_detail) }

    let(:instance) do
      UserDetailResource.find(id: user_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UserDetail.count }.by(-1)
    end
  end
end
