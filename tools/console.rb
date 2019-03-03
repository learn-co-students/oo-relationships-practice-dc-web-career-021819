require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

puts "Hello!!"
def airbnb_test
  puts "\nAirbnb"
  puts "----------------------------------------------------------------------\n"
  listing1 = Listing.new("Apt-a", "DC")
  listing2 = Listing.new("Town-a", "Seattle")
  listing3 = Listing.new("Apt-b", "Fairfax")
  listing4 = Listing.new("Town-b", "Fairfax")
  listing5 = Listing.new("Apt-c", "Fairfax")
  guest1 = Guest.new("A")
  guest2 = Guest.new("B")
  guest3 = Guest.new("C")
  guest4 = Guest.new("D")
  guest5 = Guest.new("A")
  trip1 = Trip.new(listing1, guest2)
  trip2 = Trip.new(listing2, guest4)
  trip3 = Trip.new(listing5, guest1)
  trip4 = Trip.new(listing1, guest5)
  trip5 = Trip.new(listing3, guest5)

  puts "Returns an arry of all listings"
  puts Listing.all == [listing1, listing2, listing3, listing4, listing5]
  puts "Returns all the listings for given city"
  puts Listing.find_all_by_city("Fairfax") == [listing3, listing4, listing5]
  puts "Returns an array of all trips at a listing"
  puts listing1.trips == [trip1, trip4]
  puts "Returns an array of all guests who stayed at a listing"
  puts listing1.guests == [guest2, guest5]
  puts "Returns the number of trips that have been taken to that listing"
  puts listing1.trip_count == 2
  puts "Finds the listing that has had the most trips"
  puts Listing.most_popular == listing1

  puts "Returns an array of all guests"
  puts Guest.all == [guest1, guest2, guest3, guest4, guest5]
  puts "Returns the all guests with the given name"
  puts Guest.find_all_by_name("A") == [guest1, guest5]
  puts "Returns an array of all trips a guest has made"
  puts guest5.trips == [trip4, trip5]
  puts "Returns an array of all listings a guest has stayed at"
  puts guest5.listings == [listing1, listing3]
  puts "Returns the number of trips a guest has taken"
  puts guest5.trip_count == 2
  puts "Returns an array of all guest who have made over 1 trip"
  puts Guest.pro_traveller == [guest5]


  puts "Returns the listing object for the trip"
  puts trip1.listing == listing1
  puts trip5.listing == listing3
  puts "Returns the guest object for the trip"
  puts trip2.guest == guest4
  puts trip3.guest == guest1
  puts "Returns an array of all trips"
  puts Trip.all == [trip1, trip2, trip3, trip4, trip5]
  puts "----------------------------------------------------------------------\n"
end

def bakery_test
  puts "\nBakery"
  puts "----------------------------------------------------------------------\n"
  bakery1 = Bakery.new("A")
  bakery2 = Bakery.new("B")

  dessert1 = Desserts.new("cake", bakery1)
  dessert2 = Desserts.new("ice cream", bakery1)
  dessert3 = Desserts.new("pie", bakery1)
  dessert4 = Desserts.new("tarte", bakery2)

  ingredient1 = Ingredient.new("chocolate sprinkles", 50, dessert2)
  ingredient2 = Ingredient.new("chocolate mousse", 100, dessert1)
  ingredient3 = Ingredient.new("chocolate", 80, dessert3)
  ingredient4 = Ingredient.new("milk", 13, dessert2)
  ingredient5 = Ingredient.new("egg", 15, dessert1)
  ingredient6 = Ingredient.new("butter", 30, dessert4)

  puts "Bakery#ingredients returns an array of ingredients for the bakery's desserts."
  puts bakery2.ingredients == [ingredient6]
  puts "Bakery#desserts returns an array of desserts the bakery makes."
  puts bakery1.desserts == [dessert1, dessert2, dessert3]
  puts "Bakery#average_calories returns a number totaling the average number of calories for the desserts sold at this bakery."
  puts bakery1.average_calories == 86
  puts "Bakery.all return an array of all bakeries"
  puts Bakery.all == [bakery1, bakery2]
  puts "Bakery#shopping_list return a string of names for ingredients for the bakery."
  puts bakery1.shopping_list == "chocolate mousse, egg, chocolate sprinkles, milk, and chocolate"

  puts "Desserts#ingredients return an array of ingredients for the dessert"
  puts dessert1.ingredients == [ingredient2, ingredient5]
  puts "Desserts#bakery return the bakery object for the dessert"
  puts dessert1.bakery == bakery1
  puts "Desserts#calories return a number totaling all the calories for all the ingredients included int that dessert"
  puts dessert1.calories == 115
  puts "Desserts.all return an array of all desserts"
  puts Desserts.all == [dessert1, dessert2, dessert3, dessert4]

  puts "Ingredient#dessert return a dessert object for that ingredient"
  puts ingredient2.dessert == dessert1
  puts "Ingredient#bakery return the bakery object for the bakery that uses that ingredient"
  puts ingredient2.bakery == bakery1
  puts "Ingredient.all return an array of all ingredients"
  puts Ingredient.all == [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6]
  puts "Ingredient.find_all_by_name(ingredient) take a string argument return an array of all ingredients that include that string in their name"
  puts Ingredient.find_all_by_name('chocolate') == [ingredient1, ingredient2, ingredient3]
  puts "----------------------------------------------------------------------\n"
end

def lyft_test
  puts "\nLyft"
  puts "----------------------------------------------------------------------\n"
  passenger1 = Passenger.new("A")
  passenger2 = Passenger.new("B")

  driver1 = Driver.new("driver C")
  driver2 = Driver.new("driver D")

  ride1 = Ride.new(passenger1, driver1, 1.5)
  ride2 = Ride.new(passenger2, driver1, 5.5)
  ride3 = Ride.new(passenger1, driver2, 101.0)
  ride4 = Ride.new(passenger2, driver1, 45.5)

  puts "Passenger#drivers returns all drivers a passenger has ridden with"
  puts passenger1.drivers == [driver1, driver2]
  puts "Passenger#rides returns all rides a passenger has been on"
  puts passenger1.rides == [ride1, ride3]
  puts "Passenger.all returns an array of all passengers"
  puts Passenger.all == [passenger1, passenger2]
  puts "Passenger#total_distance calculates the total distance the passenger has travelled with the service"
  puts passenger1.total_distance == 102.5
  puts "Passenger.premium_members finds all passengers who have travelled over 100miles with the service"
  puts Passenger.premium_members == [passenger1]

  puts "Driver#passengers returns all passengers a driver has had"
  puts driver1.passengers == [passenger1, passenger2]
  puts "Driver#rides returns all rides a driver has made"
  puts driver1.rides == [ride1, ride2, ride4]
  puts "Driver.all returns an array of all drivers"
  puts Driver.all == [driver1, driver2]
  puts "Driver.mileage_cap(distance) takes an argument of a distance (float) and returns all drivers who have exceeded that mileage"
  puts Driver.mileage_cap(100.0) == [driver2]

  puts "Ride#passenger returns the passenger object for that ride"
  puts ride1.passenger == passenger1
  puts "Ride#driver returns the driver object for that ride"
  puts ride1.driver == driver1
  puts "Ride.average_distance should find the average distance of all rides"
  puts Ride.average_distance == 38.375
  puts "----------------------------------------------------------------------\n"
end

def imdb_test
  puts "\nIMDB"
  puts "----------------------------------------------------------------------\n"

  puts "Movie.most_actors should return the movie which has the most actors in it."


  puts "Show#on_the_big_screen returns TV shows that share the same name as a movie."


  puts "Character#most_appearances returns which character of film/television appears in the most films or tv shows."


  puts "Actor.most_characters returns which actor has the most different characters played."


  puts "----------------------------------------------------------------------\n"
end

def crowdfunding_test
  puts "\nCrowdFunding"
  puts "----------------------------------------------------------------------\n"


  puts "----------------------------------------------------------------------\n"
end

def gym_test
  puts "\nGYM"
  puts "----------------------------------------------------------------------\n"
  client1 = Client.new("A")
  client2 = Client.new("B")
  client3 = Client.new("C")
  client4 = Client.new("D")
  client5 = Client.new("E")

  trainer1 = Trainer.new("1")
  trainer2 = Trainer.new("2")
  trainer3 = Trainer.new("3")
  trainer4 = Trainer.new("4")
  trainer5 = Trainer.new("5")

  location1 = Location.new("DC")
  location2 = Location.new("Fairfax")
  location3 = Location.new("Rockvile")

  lt11 = location1.regist_trainer(trainer1)
  lt13 = location1.regist_trainer(trainer3)
  lt14 = location1.regist_trainer(trainer4)
  lt15 = location1.regist_trainer(trainer5)
  tl21 = trainer2.regist_location(location1)

  lt21 = location2.regist_trainer(trainer1)
  lt25 = location2.regist_trainer(trainer5)
  tl42 = trainer4.regist_location(location2)

  tl33 = trainer3.regist_location(location3)

  client1.assign_trainer(trainer1)
  client2.assign_trainer(trainer1)
  client3.assign_trainer(trainer1)
  client4.assign_trainer(trainer3)
  client5.assign_trainer(trainer3)

  puts Client.all
  puts Trainer.all
  puts Location.all
  puts LocationTrainer.all == [lt11, lt13, lt14, lt15, tl21, lt21, lt25, tl42, tl33]

  puts Trainer.most_clients == trainer1
  puts Location.least_clients == location3




  puts "----------------------------------------------------------------------\n"
end





# airbnb_test
# bakery_test
# lyft_test
# imdb_test
# crowdfunding_test
gym_test



# Pry.start
