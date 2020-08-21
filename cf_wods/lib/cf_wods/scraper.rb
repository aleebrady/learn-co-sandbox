class CfWods::Scraper
  
  def self.scrape_months
    doc = Nokogiri::HTML(open("https://www.crossfit.com/workout"))
    months = doc.css("select#monthFilter option")
    months.each do |m|
      name = m.text
      CfWods::Months.new(name)
    end
  end
  
  def self.scrape_workouts(month)
    url = "https://www.crossfit.com/workout"
    doc = Nokogiri::HTML(open(url))
    
    workouts = doc.css(".show")
    workouts.each do |w|
      title = w.css("a").attr("href").text
      CfWods::Workouts.new(name, month)
    end
  end
  
   def self.scrape_details(workout)
     url = "https://www.crossfit.com/workout"
     doc = Nokogiri::HTML(open(url))
    
    wo = doc.css("div.col-sm-6 p")
    wo.each do |e|
      details = e.text.strip 
      workouts.info << details
    end
  end
  
end