require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:director) }

    it { should have_many(:character_details) }

    it { should have_many(:bookmark_statuses) }

    it { should have_many(:review_details) }
  end

  describe "InDirect Associations" do
    it { should have_many(:users_reviews) }

    it { should have_many(:users) }

    it { should have_many(:actors) }
  end

  describe "Validations" do
  end
end
