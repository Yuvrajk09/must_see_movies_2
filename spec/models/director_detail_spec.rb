require 'rails_helper'

RSpec.describe DirectorDetail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:director) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
