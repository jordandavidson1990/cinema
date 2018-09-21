require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({'first_name' => 'Tom', 'last_name' => 'Hardy', 'funds' => 20})
customer1.save()
customer2 = Customer.new({'first_name' => 'Bryan', 'last_name' => 'Jones', 'funds' => 30})
customer2.save()
customer3 = Customer.new({'first_name' => 'Hannabal', 'last_name' => 'Lector', 'funds' => 50})
customer3.save()
customer4 = Customer.new({'first_name' => 'Tony', 'last_name' => 'Stark', 'funds' => 60})
customer4.save()
customer5 = Customer.new({'first_name' => 'Tyler', 'last_name' => 'Durden', 'funds' => 5})
customer5.save()

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

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film5.id})
ticket5.save()
film1.sell_a_ticket(customer1)


binding.pry
nil
