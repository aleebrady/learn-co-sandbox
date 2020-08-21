class CfWods::Months 
  
  attr_accessor :name, :workouts
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
    @workouts = []
  end
  
  def self.all
    CfWods::Scraper.scrape_months if @@all.empty? 
   # @@all.shift # removed first element of array since it misaligned months with number of months
    @@all
  end
  
  def get_workouts
    CfWods::Scraper.scrape_workouts(self) if @workouts.empty?
  end
  
end