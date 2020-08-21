class CfWods::CLI
  
  def call 
    puts "\nWelcome to the Workout of the Day!\n"
    @input = ""
    until @input == "exit"
    get_months 
    list_months
    get_user_month
    what_to_do_now?
  end
  exit
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
    month.get_workouts
    puts "Here are the workouts for #{month.name}"
    month.workouts.each.with_index(1) do |workout, i|
      puts "#{i}. #{workout.name}"
    end
    get_user_workout(month)
    binding.pry
  end
  
  def get_user_workout(month)
    puts "Pick a workout to see the movements."
    input = gets.strip
    workout = month.workouts[input.to_i - 1]
    workout.get_workout_info
    show_workout_details(workout)
  end
  
  def show_workout_details(workout)
    puts workouts.name 
    event.info.each {|i| puts "- #{i}"}
  end
  
  def what_to_do_now? 
    puts "Would you like to see more workouts? Type 'exit' to rest"
    @input = gets.strip
  end
  
  def exit
    puts "See you next time on WODs. Enjoy your recovery!"
  end
  
end