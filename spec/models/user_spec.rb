require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    
    before(:each) do
      @user = User.create!(first_name: 'Guy', last_name: 'Dilena', email: 'guydilena@gmail.com', password: 'password', password_confirmation: 'password')
    end


    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
  

    it "it is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:first_name]).to include("can't be blank")
    end
    

    it "it is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:last_name]).to include("can't be blank")
    end
    

    it "it is not valid without email" do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:email]).to include("can't be blank")
    end


    it "it is not valid without password" do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:password]).to include("can't be blank")
    end


    it "it is not valid without password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:password_confirmation]).to include("can't be blank")
    end


    it "it is not valid without a unique email" do
      @user1 = User.create!(first_name: 'Guy', last_name: 'Dilena', email: 'guy1dilena@gmail.com', password: 'password', password_confirmation: 'password')
      @user.email = 'guy1dilena@gmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include("has already been taken")
    end

  
    it "it is not valid without a password minimum length" do
      @user.password = 'abcd'
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 5 characters)")
    end

    end
end

  # describe '.authenticate_with_credentials' do
  #   # examples for this class method here
  # end

