class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end 
  
  def memberships
    Membership.all.filter { |mems| mems.gym == self }
  end 

  def lifters
    memberships.map { |mems| mems.lifter }
  end 

  def lifter_names 
    lifters.map { |lifters| lifters.name }
  end 

  def total_lift
    lifters.map { |lifters| lifters.lift_total}.sum
  end 
end
