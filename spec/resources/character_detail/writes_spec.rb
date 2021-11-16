require "rails_helper"

RSpec.describe CharacterDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "character_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CharacterDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CharacterDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:character_detail) { create(:character_detail) }

    let(:payload) do
      {
        data: {
          id: character_detail.id.to_s,
          type: "character_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CharacterDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { character_detail.reload.updated_at }
      # .and change { character_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:character_detail) { create(:character_detail) }

    let(:instance) do
      CharacterDetailResource.find(id: character_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CharacterDetail.count }.by(-1)
    end
  end
end
