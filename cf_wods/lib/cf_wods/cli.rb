class CfWods::CLI
  
  def call 
    puts "\nWelcome to the Workout of the Day!\n"
    get_months 
    list_months
    get_user_month
  end
  
  def get_months
    @months = CfWods::Months.all 
  end
  
  def list_months
    puts "Pick a month to see workouts."
    @months.each.with_index(1) do |month, index| 
    puts "#{index}. #{month.name}" #changed index to -1 since it was not lining up with the correct month from scrape. need to remove "month"
  end
  end
  
  def get_user_month
    month_selected = gets.strip.to_i
    show_workouts_for(month_selected) if valid_input(month_selected, @months) #added + 1 to month selected to correspond to correct month number
  end
  
  def valid_input(input, data)
     input.to_i <= data.length && input.to_i > 0
  end
  
  def show_workouts_for(month_selected)
    month = @months[month_selected - 1]
    puts "Here are the workouts for #{month.name}"
    #CfWods::Workouts.all.each.each.with_index do |workout| puts worout.name 
    #get_user_workout
  end
  
end