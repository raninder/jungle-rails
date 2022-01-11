require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'password should match password_confirmation' do
      user = User.new
      user.first_name = "Sam"
      user.last_name = "wood"
      user.password = '12344'
      user.email="dd@a.com"
      user.password_confirmation = "12345"
      user.validate
      expect(user).to_not be_valid
    end

    it "email should be unique" do
      user1= User.create(first_name:"Sam",last_name:"wood",email:"test@test.com", password:"12345")
      user2= User.create(first_name:"Aby",last_name:"Leckey",email:"test@test.com", password:"45678")
      expect(user2.errors[:email].first).to eq('has already been taken')      
    end

    it "email should be unique(case sensitive)" do
      user1= User.create(first_name:"Sam",last_name:"wood",email:"test@test.com", password:"123456")
      user2= User.create(first_name:"Aby",last_name:"Leckey",email:"TEST@test.com", password:"456789")
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include ("Email has already been taken")   
    end

    it "email is required" do 
        user = User.new(email: nil)
        user.validate
        expect(user).to_not be_valid
    end

    it "first name is required" do 
      user = User.new(first_name: nil)
      user.validate
      expect(user).to_not be_valid
    end

    it "last name is required" do 
      user = User.new(last_name: nil)
      user.validate
      expect(user).to_not be_valid
    end

    it "minimum password of 4 characters" do 
      user= User.new(first_name:"Sam",last_name:"wood",email:"test@test.com", password:"123")
      user.validate
      expect(user).to_not be_valid
    end
  end

    describe '.authenticate_with_credentials' do

      before do
        @user = User.create!(
          first_name: 'Sam',
          last_name: 'Test',
          email: 'test@test.com',
          password: '123456',
          password_confirmation: '123456'
          )
      end
      
      # authentication specs
      it "user exist in database" do
      user = User.authenticate_with_credentials('test@test.com', '123456')
      expect(user).not_to be(nil)
      end 

      it "user doesn't exist in database" do
        user = User.authenticate_with_credentials('best@test.com', '123456')
        expect(user).to be(nil)
        end 
    

    it "email may contain spaces" do
      user = User.authenticate_with_credentials('  test@test.com ', '123456')
      expect(user).not_to be(nil)
    end

    it "email may contain uppercase letters" do
      user = User.authenticate_with_credentials('Test@tEst.com ', '123456')
      expect(user).not_to be(nil)
    end
  end
end
