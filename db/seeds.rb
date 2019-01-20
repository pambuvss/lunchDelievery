100.times do 
	name = Faker::Name.name
	email =  Faker::Internet.email
	user = User.new(email: email, password: email, password_confirmation: email, name: name)
	user.save
end