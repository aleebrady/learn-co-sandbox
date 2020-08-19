class CfWods::Scraper
  
  def self.scrape_months
    doc = Nokogiri::HTML(open("https://www.crossfit.com/workout"))
    months = doc.css("select#monthFilter option") 
    months.each do |m|
      name = m.text
      CfWods::Months.new(name)
    end
  end
  
  
end