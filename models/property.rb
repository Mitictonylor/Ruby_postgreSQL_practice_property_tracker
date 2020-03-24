require('pg')

Class Property
  attr_accessor :number_of_bedrooms, :year_built, :buy_let, :build
  attr_reader :id
  def initialize(houses)
    @number_of_bedrooms = houses["number_of_bedrooms"]
    @year_built = houses["year_built"]
    @buy_let = houses["buy_let"]
    @build = houses["build"]
    @id = houses["id"].to_i if houses['id']
  end




end
