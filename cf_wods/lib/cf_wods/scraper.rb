class CfWods::Scraper
  
  def self.scrape_months
    doc = Nokogiri::HTML(open("https://www.crossfit.com/workout"))
    months = doc.css("select#monthFilter option")
    months.shift
    months.each do |m|
      name = m.text
      CfWods::Months.new(name)
    end
  end
  
  def self.scrape_workouts(month)
    url = "https://wodwell.com/wods/?sort=popular"
    doc = Nokogiri::HTML(open(url))
    
    workouts = doc.css("div.wod-description")
    workouts.each do |w|
      title = w.css("h2.wod-title").text
      CfWods::Workouts.new(title, month)
    end
  end
  
   def self.scrape_details(workout)
     url = "https://wodwell.com/wods/?sort=popular"
     doc = Nokogiri::HTML(open(url))
    
    wo = doc.css("div.wod-description")
    wo.each do |e|
      details = e.text.gsub(/\s+/," ")  
      workout.info << details
    end
  end
  
end