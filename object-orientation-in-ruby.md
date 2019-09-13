# Object-Oriented Ruby

Objects are represented somewhat differently in Ruby than they are in JavaScript, but the core concepts are the same.

### Learning Goals

- Discuss what object-oriented programming, state, and behavior look like in Ruby compared to JavaScript

## A Brief Review of OOP

When first diving into JavaScript, we discussed Functional vs Object-Oriented programming. In Object-Oriented programming, we are able to organize our code using _objects_ to hold the *state* (data) and *behavior* (functions) of the same types of items in our code.

In our prior reading on [JS State and Behavior][1], we used the example of a spaceship object. Let's take a dive into what that would look like in Ruby.

#### Functions and Data in Space

As we did in JavaScript, let's first create a single hash that holds our ship data and represents the *state* of our ship. Additionally, we will want the ship to (presumably) be able to announce who its captain is as well as launch into orbit.

We could accomplish this like so:

```ruby
def captains_announcement(ship, captain)
  "#{ship} will be captained by #{captain} for the flight."
end

def launch_ship(ship)
  "#{ship} has launched into orbit!"
end

ship = {
  name: "Serenity",
  captain: "Malcolm Reynolds"
}

puts captains_announcement(ship[:name], ship[:captain])
puts launch_ship(ship[:name])
```

This gives us our desired output as follows:

```no-highlight
Serenity will be captained by Malcolm Reynolds for the flight.
Serenity has launched into orbit!
```

Look at those functions that require a bunch of stuff to be passed into them! They are intimately dependent on the state of a ship - one requires knowing the name, while the other wants both the name and the captain.

And what if we wanted to add the amount of fuel to the spaceship, as well as make `launch_ship` dependent on that?

```ruby
def captains_announcement(ship, captain)
  "#{ship} will be captained by #{captain} for the flight."
end

def launch_ship(ship, fuel)
  if fuel > 50
    "#{ship} has launched into orbit!"
  elsif fuel > 25
    "It was a little touch and go at first, but #{ship} managed to make it into orbit!"
  else
    "#{ship} struggled to take flight and promptly crashed back down to the surface."
  end
end

ship = {
  name: "Serenity",
  captain: "Malcolm Reynolds",
  fuel: 15
}

puts captains_announcement(ship[:name], ship[:captain])
puts launch_ship(ship[:name], ship[:fuel])
```

... would give the following output:

```no-highlight
Serenity will be captained by Malcolm Reynolds for the flight.
Serenity struggled to take flight and promptly crashed back down to the surface.
```

Both of our functions now depend on several pieces of information about the ship. These functions are starting to make sense _only in relation to_ the state of an increasingly complicated hash of information. But there has to be a way to put both our `ship` hash, or *state*, and our methods, or *behavior*, into one object, right? Enter **classes**!

## Class

A `class` represents an object that can have state and behavior, and while the terminology and setup might look a little odd, they can provide us with much cleaner ways of interacting with state and behavior than we were able to above.

### Objects in Space

What would a class-based version of our above code look like? Let's don some spacesuits, jump out into [the Verse][2], and take a look at our "brand new" Firefly, this time as a `Spaceship` object!

```ruby
class Spaceship
  def initialize(name, captain, fuel)
    @name = name
    @captain = captain
    @fuel = fuel
  end

  def captains_announcement
    "#{@name} will be captained by #{@captain} for the flight."
  end

  def launch
    if @fuel > 50
      "#{@name} has launched into orbit!"
    elsif @fuel > 25
      "It was a little touch and go at first, but #{@name} managed to make it into orbit!"
    else
      "#{@name} struggled to take flight and promptly crashed back down to the surface."
    end
  end
end

ship = Spaceship.new("Serenity", "Malcolm Reynolds", 45)

puts ship.captains_announcement
puts ship.launch
```

There is a *lot* going on there, so let's take it piece by piece.

### Our "New" Ship

```ruby
class Spaceship
  def initialize(...)
    ...
  end

  ...
end

ship = Spaceship.new(...)

...
```

We start by defining a `class`, which in many ways is like creating a _template_ (or blueprint) for any new objects of that class that we create.
Classes all have a default **constructor** function, which Ruby calls `.new`.
Calling `Spaceship.new` creates an _instance_ of the `Spaceship` class as well as _initializes_ it.

### Initialization

**"Initialization"** in this context is just setting up the **state** of the new instance - we pass data into the `.new` constructor, which will then call `initialize`.
The `initialize` method allows us take the data and assign it to **instance variables** (anything with an `@` at the beginning of the variable name).

```ruby
class Spaceship
  def initialize(name, captain, fuel)
    @name = name
    @captain = captain
    @fuel = fuel
  end

  ...
```

Instance variables are different from the normal variables that we're used to.
When we define regular variables within a function, without the `@` symbol, those variables are only accessible _within_ the function.
(Their scope is _local_ to the function.)

When we use instance variables, those variables become local to the _instance of the class itself_, meaning that we can use them anywhere inside the object - including inside other functions, without having to pass them around!

### Method(s) to the Madness

We've been using the word _function_ this whole time, but similar to JavaScript, many languages (including Ruby) generally use the term **method** to refer to a function that's defined on an object.

> Many Rubyists will even say that every function in Ruby is technically a method, but we won't get into the details here. Just keep in mind that when we're talking about functions for objects, we'll refer to them as _methods_ from now on - `initialize` is a _method_, not just a function.

Our class has several methods beyond `initialize`, too, including `.captains_announcement` and `.launch`.
We defined these on `Spaceship` because we decided they all represent behavior that _belongs to_ our ship.

#### Calling All Methods

Perhaps one of the greatest benefits to classes is _encapsulation_. Once we initialize an instance with a given state, we can provide an _interface_ for that state (through methods), and anyone who uses our class doesn't have to care about what's happening under the hood. For instance, the difference between...

```ruby
ship = {
  name: "Serenity",
  captain: "Malcolm Reynolds",
  fuel: 15
}

captains_announcement(ship[:name], ship[:captain])
launch_ship(ship[:name], ship[:fuel])
```

... and...

```ruby
ship = Spaceship.new("Serenity", "Malcolm Reynolds", 45)

ship.captains_announcement
ship.launch
```

... is rather striking, isn't it?

We decide internally what information `launch` and `captains_announcement` depend on, and anyone using our `Spaceship` class need only care about the state to start with and the name of the methods to use.

## Summary

**Object Oriented Programming** is an incredibly popular and powerful programming pattern that allows us to write large, complex programs.
Objects **encapsulate** data and logic that are fundamentally intertwined, which helps us write much better organized, and much more understandable, code.

We have had quite a journey through a (brief) history of different programming patterns...

- Imperative - declarative statements executed line by line
- Functional - storing related bits of logic into repeatable units
- Class-based - storing related data and behavior together into objects

... and we've explored different ways of storing data...

- Variables _outside_ of classes
- The state _inside_ a class, via instance variables

... as well as storing logic.

- Functions outside of classes
- Methods defined on classes

In further readings, we will explore:

- Breaking complex systems down into classes
- Interactions between classes
- Exposing a class's state to the outside world
- Passing arguments into methods

[1]: https://learn.launchacademy.com/lessons/state-and-behavior-js
[2]: http://firefly.wikia.com/wiki/The_Verse
