require('pry')
require_relative('models/customer')
require_relative('models/film')

Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'first_name' => 'Tom', 'last_name' => 'Hardy', 'funds' => 20})
customer1.save()
customer2 = Customer.new({'first_name' => 'Bryan', 'last_name' => 'Jones', 'funds' => 30})
customer2.save()
customer3 = Customer.new({'first_name' => 'Hannabal', 'last_name' => 'Lector', 'funds' => 50})
customer3.save()

film1 = Film.new({'title' => 'Star Wars', 'price' => 8})
film1.save()
film2 = Film.new({'title' => 'Casablanca', 'price' => 6})
film2.save()
film3 = Film.new({'title' => 'Call Me By Your Name', 'price' => 7})
film3.save()
film4 = Film.new({'title' => 'Mulholland Drive', 'price' => 10})
film4.save()
film5 = Film.new({'title' => 'Fight Club', 'price' => 12})
film5.save()

binding.pry
nil
