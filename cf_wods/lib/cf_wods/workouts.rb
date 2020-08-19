class CfWods::Workouts 
  
  attr_accessor :name, :month, :details
  
  @@all = []
  
  def initialize(name, month)
    @name = name 
    @month = month
    @@all << self
    #notify month about the workout
    add_to_month
  end
  
  def self.all
    @@all
  end
  
  def add_to_month
    @month.workouts << self unless @month.workouts.include?(self)
  end
  

  
end