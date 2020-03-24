require('pg')

class Property
  attr_accessor :number_of_bedrooms, :year_built, :buy_let, :build
  attr_reader :id
  def initialize(houses)
    @number_of_bedrooms = houses["number_of_bedrooms"]
    @year_built = houses["year_built"]
    @buy_let = houses["buy_let"]
    @build = houses["build"]
    @id = houses["id"].to_i if houses['id']
  end

  def save()
    #connect pg to the postgres database name from where it is
    db = PG.connect({dbname: 'properties', host:'localhost'})
    #create a variable that will contain the sql command we want to run
    command = "INSERT INTO properties
              (numbers_of_bedrooms, year_built, buy_let, build)
               VALUES
               ($1,$2,$3,$4)
               RETURNING * "
    #we assign each of the values to the $ to avoid external sql injection
    values = [@number_of_bedrooms, @year_built, @buy_let, @build]
    #we associate a string to the command we want to run
    db.prepare("save", command)
    #take the first element of the date (id) and saves it into the instance variable
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    #close the connection
    db.close()
  end


  def update()
    db = PG.connect({dbname: 'properties', host:'localhost'})
    command = "UPDATE properties
              SET (numbers_of_bedrooms, year_built, buy_let, build)
              =
              ($1,$2,$3,$4)
              WHERE id = $5"
    values = [@number_of_bedrooms, @year_built, @buy_let, @build, @id]
    db.prepare("update", command)
    db.exec_prepared("update", values)
    db.close()
  end


  def delete()
    db = PG.connect({dbname: 'properties', host:'localhost'})
    command = "DELETE FROM properties WHERE id = $1"
    value = [@id]
    db.prepare("delete_one", command)
    db.exec_prepared("delete_one", value)
    db.close
  end

  
end
