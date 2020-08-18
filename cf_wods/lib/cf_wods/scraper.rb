class CfWods::Scraper
  
  def scrap_months
    doc = Nokogiri::HTML(open("https://www.crossfit.com/workout"))
    binding.pry
  end
  
  
end