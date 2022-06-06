class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end 

  def sign_up(gym, cost)
    Membership.new(self,gym, cost)
  end 

  def memberships
    Membership.all.filter { |memberships| memberships.lifter == self }
  end 

  def gyms 
    memberships.map { |mems| mems.gym}
  end 

  def self.average_lift
    Lifter.all.map { |lifter| lifter.lift_total}.sum / Lifter.all.count
  end 

  def total_cost
    memberships.map { |mem| mem.cost}.sum
  end 
end
