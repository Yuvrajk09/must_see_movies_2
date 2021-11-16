require "rails_helper"

RSpec.describe UserDetail, type: :model do
  describe "Direct Associations" do
    it { should have_many(:review_details) }

    it { should have_many(:bookmark_statuses) }
  end

  describe "InDirect Associations" do
    it { should have_many(:movies_reviews) }

    it { should have_many(:movies_bookmarks) }
  end

  describe "Validations" do
  end
end
