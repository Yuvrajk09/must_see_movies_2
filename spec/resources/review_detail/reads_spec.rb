require 'rails_helper'

RSpec.describe ReviewDetailResource, type: :resource do
  describe 'serialization' do
    let!(:review_detail) { create(:review_detail) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(review_detail.id)
      expect(data.jsonapi_type).to eq('review_details')
    end
  end

  describe 'filtering' do
    let!(:review_detail1) { create(:review_detail) }
    let!(:review_detail2) { create(:review_detail) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: review_detail2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([review_detail2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:review_detail1) { create(:review_detail) }
      let!(:review_detail2) { create(:review_detail) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            review_detail1.id,
            review_detail2.id
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
            review_detail2.id,
            review_detail1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
