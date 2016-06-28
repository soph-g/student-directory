@students = []

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    process(selection)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    print_header
    print_students_list
    print_footer
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end




def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Please enter the next student, or hit enter to finish"
    name = gets.chomp
  end
  # return the array of students
  @students
end


def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count > 1
    puts "Overall we have #{@students.count} great students"
  elsif @students.count == 1
    puts "Overall we have #{@students.count} great student"
  end
end


# nothing happens until we call the methods
interactive_menu
