require 'rails_helper'

RSpec.describe User, type: :model do
  
  # This shows that our factory is valid and therefore no need to write tests for it.
  context "valid factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  context "user validations" do
    before(:each) do
      @user = create(:user)
    end

    it "should be invalid without an email" do
      @user.email = ""
      expect(@user).to_not be_valid
    end

    it "should be invalid without a password" do
      @user.password = ""
      expect(@user).to_not be_valid
    end

    it "should be invalid if password_confirmation doesn't match" do
      @user.password_confirmation = "passwrod"
      expect(@user).to_not be_valid
    end

    it "should be invalid with a duplicated email" do
      user2 = @user.dup
      expect(user2).to_not be_valid
    end
  end


end
