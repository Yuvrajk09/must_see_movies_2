require 'rails_helper'

RSpec.describe BookmarkStatus, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:bookmark) }

    end

    describe "InDirect Associations" do

    it { should have_one(:movie) }

    end

    describe "Validations" do

    end
end
