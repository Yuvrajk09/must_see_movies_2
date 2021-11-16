require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:movies) }

    end

    describe "InDirect Associations" do

    it { should have_many(:bookmark_statuses) }

    end

    describe "Validations" do

    end
end
