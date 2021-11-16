require 'rails_helper'

RSpec.describe ActorDetail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:actors) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
