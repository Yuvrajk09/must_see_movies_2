require "rails_helper"

RSpec.describe DirectorDetail, type: :model do
  describe "Direct Associations" do
    it { should have_many(:movies) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
