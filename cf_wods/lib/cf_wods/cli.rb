class CfWods::CLI
  
  def call 
    puts "\nWelcome to Hero Workouts!\n"
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
    puts "\nPick a number to see workouts for the month:\n"
    @months.each.with_index(1) do |month, index| 
    puts "\n#{index}. #{month.name}\n" 
  end
  end
  
  def get_user_month
    month_selected = gets.strip.to_i
    show_workouts_for(month_selected) if valid_input(month_selected, @months)
  end
  
  def valid_input(input, data)
     input.to_i <= data.length && input.to_i > 0
  end
  
  def show_workouts_for(month_selected)
    month = @months[month_selected - 1]
    month.get_workouts
    puts "\nHere are the workouts for #{month.name}:\n"
    month.workouts.each.with_index(1) do |workout, i|
      puts "#{i}. #{workout.name}"
    end
    get_user_workout(month)
  end
  
    def get_user_workout(month)
    puts "Pick a workout to see the movements."
    input = gets.strip
    workout = month.workouts[input.to_i - 1]
    #binding.pry
    workout.get_workout_info
    show_workout_details(workout)
  end
  
  def show_workout_details(workout)
    puts workout.name 
    workout.info.each {|i| puts "- #{i}"}
  end
  
  def what_to_do_now? 
    puts "\nWant to see more workouts? Press enter or type 'exit' to rest and recover\n"
    @input = gets.strip
  end
  
  def exit
    puts "\nSee you next time on Hero Workouts. Enjoy your recovery!\n"
  end
  
end