class CfWods::Workouts 
  
  attr_accessor :name, :month, :info
  
  @@all = []
  
  def initialize(name, month)
    @name = name 
    @month = month
    @@all << self
    @info = []
    add_to_month
  end
  
  def self.all
    @@all
  end
  
  def add_to_month
    @month.workouts << self unless @month.workouts.include?(self)
  end
  
  def get_workout_info
    CfWods::Scraper.scrape_details(self) if @info.empty?
  end
  
end