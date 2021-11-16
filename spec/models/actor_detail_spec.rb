require "rails_helper"

RSpec.describe ActorDetail, type: :model do
  describe "Direct Associations" do
    it { should have_many(:character_details) }
  end

  describe "InDirect Associations" do
    it { should have_many(:movies) }
  end

  describe "Validations" do
  end
end
