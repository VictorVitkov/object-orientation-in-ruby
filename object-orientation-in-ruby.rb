require 'pry'

#*******************************************************************************
# This is the convoluted way to do this.

puts "ok lets do this"
puts "\n"

def captains_announcement(ship, captain)
  "#{ship} will be captained by #{captain} for the flight."
end

def launch_ship(ship, fuel, captain)
  if fuel > 50
    "#{ship} has launched into orbit!!"
  elsif fuel > 25
    "#{ship} barely had enough fuel to make it into orbit!!"
  else
    "#{ship} struggled to take flight and promptly crashed back to earth. #{captain} forgot to add rocket fuel and attempted to take off with just #{fuel} gallons in the tank!"
  end
end

ship = {
  name: "Gatticca 3000",
  captain: "Ethan Hawke",
  fuel: 15
}

puts captains_announcement(ship[:name], ship[:captain])
puts "\n"

puts launch_ship(ship[:name], ship[:fuel], ship[:captain])
puts "************************************************************************"
puts "\n"

#*******************************************************************************
# This is the better way to do it using classes:

class Spaceship
  def initialize(name, captain, fuel)
    @name = name
    @captain = captain
    @fuel = fuel
  end

  def captains_announcement
    "#{@name} will be captained by #{@captain} for today's flight"
  end

  def launch
    if @fuel > 50
      "#{@name} has launched into orbit!!"
    elsif @fuel > 25
      "#{@name} barely had enough fuel to make it into orbit!!"
    else
      "Captain #{@captain} forgot to fill up the tank and attempted to take off with just #{@fuel} gallons in the tank. #{@name} promptly crashed back to earth upon takeoff *explosion in background*."
    end
  end
end

ship = Spaceship.new("Gatticca 3000", "Ethan Hawke", 15)

puts ship.captains_announcement
puts ship.launch
puts "************************************************************************"
puts "\n"

#*******************************************************************************
class Rectangle
  def initialize(length, width)
    @length, @width = length, width
  end

  attr_reader :length, :width

  # the methods below are functionally equivalent to attr_reader

  # def length
  #   @length
  # end
  #
  # def width
  #   @width
  # end

  def perimeter
    @length * 2 + @width * 2
  end

  def area
    @length * @width
  end

  def summary
    {
      length: self.length,
      width: self.width,
      perimeter: self.perimeter,
      area: self.area
    }
  end
end

epic_rectangle = Rectangle.new(3, 4)

puts "The perimeter of the epic rectangle is #{epic_rectangle.perimeter}"
puts "\n"

puts epic_rectangle.summary

puts "************************************************************************"
puts "\n"

class Book
  def initialize (title, author, category)
    @title = title
    @author = author
    @category = category
  end

  def summary
    "#{@title}, by #{@author} (#{@category})"
  end
end

book = Book.new('User Stories Applied', 'Mike Cohn', 'Technical')
puts book.summary
puts "\n"

other_book= Book.new('Pragmatic Thinking and Learning', 'Andy Hunt', 'Technical')
puts other_book.summary
puts "\n"

puts "************************************************************************"
puts "\n"

class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hello, #{@name}."
  end
end

brianna = Person.new('Brianna')
casi = Person.new('Casi')


puts brianna.greet
puts casi.greet
