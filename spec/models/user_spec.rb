require 'rails_helper'

RSpec.describe User, type: :model do
	describe "register" do
		  it "empty information of user" do
		  	user = User.new
		  	expect(user.save).to eql false
		  end
		  it "full information of user" do
		  	user = User.new(email: "la@la.com", password: '123456',
		  	password_confirmation: '123456', name: 'testName') 
		  	expect(user.save).to eql true
		  end
		  it "different passwords" do
		  	user = User.new(email: "la@la.com", password: '123456',
		  	password_confirmation: '1234ff56', name: 'testName') 
		  	expect(user.save).to eql false
		  end
		end
end
