require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price, :age_limit
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
    @age_limit = options['age_limit'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price, age_limit)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @price, @age_limit]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE from films SET (title, price) = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @price, @age_limit, @id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON customers.id = tickets.customer_id
    WHERE customer_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def check_customer_age(customer)
    if customer.age >= @age_limit
      return true
    else
      return false
    end
  end

  def sell_a_ticket(customer)
    if (customer.funds >= @price && check_customer_age(customer))
      customer.remove_money(@price)
      Ticket.new({'customer_id' => customer.id, 'film_id' => @id}).save()
    end
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_data = SqlRunner.run(sql)
    return Film.map_items(film_data)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end
end
