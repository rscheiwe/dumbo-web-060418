require 'pry'

class Painter

  attr_accessor :name, :style       # Accessors - Both readers and writers
  attr_reader :age                  # Readers - can only read an attribute
  # attr_writer :name, :age, :style # Writers - can only write to an attribute

  @@all = []                        # Class variable, we'll store all instances
                                    # inside of this variable

  # Initialize - A lifecycle method
  # ===============================
  # - We only hit this method if we say Painter.new
  # - We need three arguments because we defined it as such
  def initialize(name, age, style)
    # - We assign our attributes (instance variables) here!
    @name = name
    @age = age
    @style = style

    # - As well as pushed all instances inside of our @@all
    @@all << self
  end

  # A Class Method (look at where self is with `def`)
  # ===============================
  # Can only be called on the class
  # So what would that look like? `Painter.all`
  def self.all
    @@all
  end

  # An Instance Method (notice no self with `def`)
  # ===============================
  # Can only be called on an instance!
  # So we will need to create an instance of our Painter
  # Then we will be able to call them here `prince.whoami`
  def whoami
    puts "Who am I?: #{self.name}"
    # SELF IS THE INSTANCE INSIDE OF AN INSTANCE METHOD
  end

  # Attribute Readers
  # They expose instance variables to the world
  # def name
  #   @name
  # end
  #
  # def style
  #   @style
  # end
  #
  # def age
  #   @age
  # end

  # Attribute Writer
  # Only to change the instance variable
  # def style=(style)
  #    @style = style
  # end
  #
  # def age=(age)
  #   @age = age
  # end
  #
  # def name=(name)
  #   @name = name
  # end
end

prince = Painter.new("Prince", 10000, "Modernism")
daniel = Painter.new("Daniel", 1, "Expressionist")
Pry.start
