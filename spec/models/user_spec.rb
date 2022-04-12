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
      @user.email = 'GUy1dilena@gmail.com'
      expect(@user).to_not be_valid
      expect(@user.errors[:email]).to include("has already been taken")
    end

  
    it "it is not valid without a password minimum length" do
      @user.password = 'abcd'
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 5 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
  
    before(:each) do
      @user = User.create!(first_name: 'Guy', last_name: 'Dilena', email: 'helloABC@gmail.com', password: 'password', password_confirmation: 'password')
    end


    it "it should return nil if password doesn't match" do
      user_test = User.authenticate_with_credentials('helloABC@gmail.com', 'passw')
      expect(user_test).to be_nil
    end

    it "it should return nil if email doesn't match" do
      user_test = User.authenticate_with_credentials('guilena11@gmail.com', 'password')
      expect(user_test).to be_nil
    end

    it "it should return user if it authenticates" do 
      user_test = User.authenticate_with_credentials('helloABC@gmail.com', 'password')
      expect(user_test).to eq(@user)
    end

    it "it should pass with extra spaces" do
      user_test = User.authenticate_with_credentials('     helloABC@gmail.com     ', 'password')
      expect(user_test).to eq @user
    end

    it "it should pass no matter case sensitivity" do
    user_test = User.authenticate_with_credentials('heLLOabc@gmail.com', 'password')
    expect(user_test).to eq @user
    end
  
  end
end