require 'rails_helper'

RSpec.describe Movie, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmark_statuses) }

    it { should have_many(:review_details) }

    it { should have_many(:actor_details) }

    it { should have_one(:director_detail) }

    it { should belong_to(:movie) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
