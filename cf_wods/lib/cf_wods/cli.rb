class CfWods::CLI
  
  def call 
    puts "Welcome to the Workout of the Day!"
  end
  
  def get_months
    @months = ['Jan 2020', 'Feb 2020', 'Mar 2020', 'Apr 2020', 'May 2020','June 2020','July 2020','Aug 2020']
  end
  
  def list_months
    @months.each_with_index(1) do |month, index| 
    puts "#{index}. #{month}"
  end
  end
  
end