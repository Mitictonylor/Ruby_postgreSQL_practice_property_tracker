require('pry-byebug')


require_relative('models/property')

house1 = Property.new({ 'number_of_bedrooms' => 3,
                        'year_built' => 1985,
                        'buy_let' => 'buy',
                        'build' => 'flat'
                      });
house2 = Property.new({ 'number_of_bedrooms' => 1,
                        'year_built' => 2005,
                        'buy_let' => 'rent',
                        'build' => 'studio'
                      });
house3 = Property.new({ 'number_of_bedrooms' => 5,
                        'year_built' => 2020,
                        'buy_let' => 'buy',
                        'build' => 'detached'
                      });
# house1.save()
# house2.save()
# house1.year_built = 1994
# house1.number_of_bedrooms = 4
# house1.update()
# house2.delete()
Property.find(4) # or find_house = Property.find()
house3.save()
binding.pry
Property.find_by_year() #or houses = Property.find_by_year()
# house1.find(3)
nil
