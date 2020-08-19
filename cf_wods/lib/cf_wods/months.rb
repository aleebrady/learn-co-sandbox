class CfWods::Months 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end
  
  def self.all
    CfWods::Scraper.scrape_months if @@all.empty? 
    @@all.shift # removed first element of array since it misaligned months with number of months
    @@all
  end
  
end