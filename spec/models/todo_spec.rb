require 'rails_helper'

RSpec.describe Todo, type: :model do
  context "valid factory" do
    it "should have a valid factory" do
      expect(build(:todo)).to be_valid
    end
  end
end
