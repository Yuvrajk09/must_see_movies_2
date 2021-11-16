require 'rails_helper'

RSpec.describe ActorDetailResource, type: :resource do
  describe 'serialization' do
    let!(:actor_detail) { create(:actor_detail) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(actor_detail.id)
      expect(data.jsonapi_type).to eq('actor_details')
    end
  end

  describe 'filtering' do
    let!(:actor_detail1) { create(:actor_detail) }
    let!(:actor_detail2) { create(:actor_detail) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: actor_detail2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([actor_detail2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:actor_detail1) { create(:actor_detail) }
      let!(:actor_detail2) { create(:actor_detail) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            actor_detail1.id,
            actor_detail2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            actor_detail2.id,
            actor_detail1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
