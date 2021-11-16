require "rails_helper"

RSpec.describe DirectorDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "director_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DirectorDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { DirectorDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:director_detail) { create(:director_detail) }

    let(:payload) do
      {
        data: {
          id: director_detail.id.to_s,
          type: "director_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DirectorDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { director_detail.reload.updated_at }
      # .and change { director_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:director_detail) { create(:director_detail) }

    let(:instance) do
      DirectorDetailResource.find(id: director_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { DirectorDetail.count }.by(-1)
    end
  end
end
