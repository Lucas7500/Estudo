module Walk
  def walk(steps)
    puts "#{@name.capitalize} took #{steps} steps"
  end
end

class Dog
  def initialize(name)
    @name = name
  end

  include Walk
end

sparky = Dog.new('Sparky')
fido = Dog.new('fido')

sparky.walk(4)
fido.walk(4)
