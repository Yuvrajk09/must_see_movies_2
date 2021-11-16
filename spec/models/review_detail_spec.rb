require "rails_helper"

RSpec.describe ReviewDetail, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:movie) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
