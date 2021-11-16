require 'rails_helper'

RSpec.describe BookmarkStatusResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'bookmark_statuses',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BookmarkStatusResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BookmarkStatus.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:bookmark_status) { create(:bookmark_status) }

    let(:payload) do
      {
        data: {
          id: bookmark_status.id.to_s,
          type: 'bookmark_statuses',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BookmarkStatusResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { bookmark_status.reload.updated_at }
      # .and change { bookmark_status.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:bookmark_status) { create(:bookmark_status) }

    let(:instance) do
      BookmarkStatusResource.find(id: bookmark_status.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BookmarkStatus.count }.by(-1)
    end
  end
end
