require 'pry'

class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@owners = []

  def initialize(species)
    @species = species
    @@owners << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    return "I am a #{@species}."
  end


  def Owner.all
    @@owners
  end

  def Owner.count
    @@owners.count
  end

  def Owner.reset_all
    @@owners.clear
  end

  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    self.pets[:fishes] << fish
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name)
    self.pets[:cats] << cat
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    pets[:cats][0].mood = "happy"
  end

  def feed_fish
    pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    @pets.each do |species, animals| 
      animals.each do |animal| 
        animal.mood= "nervous"
      end
    end
     @pets.each {|type, pets| pets.clear }
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end 

end

