def create_restaurant_and_seller name
    # for example, if name = "Best Fast Food" =>
    # seller's account create with email and passw = "BestFastFood@ld.com"

    restaurant = Restaurant.new(name: name)
    restaurant.save
    email = name.tr('^A-Za-z0-9', '') + "@ld.com"
    password = email
    name = Faker::Name.name
    seller = User.new(email: email, name: name, password: password,
        password_confirmation: password, role: :seller, restaurant: restaurant)
    seller.save
end

names = ["Best Fast Food", "Blue Eye", "Black Burger", "Simple Food",
         "Chinese Restaurant", "Zabe Restaurant", "XXL Foood", "Small Place",
         "Large Place", "Food With Soul", "Smelly Pot", "Vegeterian Restaurant",
         "Tasteless Food", "Red Onion", "Pink Dolphin", "Terrible pain",     
         "Albatross", "Ku Ka Ke", "Green Piece",  "White Burger"]

names.each { |name| create_restaurant_and_seller name}