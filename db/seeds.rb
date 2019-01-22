100.times do 
	name = Faker::Name.name
	email =  Faker::Internet.email
	user = User.new(email: email, password: email, password_confirmation: email, name: name)
	user.save
end

30.times do
	restaurant_name =  Faker::Company.name
    restaurant = Restaurant.new(name: restaurant_name)
    restaurant.save


    email = (restaurant.name.sub ' ', '.') + '@ld.com'
    name = Faker::Name.name 
    seller = User.new(email: email, password: email, password_confirmation: email, 
    	name: name, role: :seller, restaurant_id: restaurant.id)
    seller.save
end