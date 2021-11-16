require 'rails_helper'

RSpec.describe ReviewDetail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
