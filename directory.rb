@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end


def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end


def show_students
  print_header
  print_students_list
  print_footer
end


def input_students
  name = get_student_name
  while !name.empty? do
    create_array(name, "november")
    puts "Now we have #{@students.count} students"
    name = get_student_name
  end
end

def get_student_name
  puts "Please enter the name of the student"
  puts "Hit enter twice to finish"
  name = STDIN.gets.chomp
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


def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # interate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def load_students(filename = "students.csv")
  @students = []
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    create_array(name, cohort)
  end
  file.close
end


def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

def create_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# nothing happens until we call the methods
try_load_students
interactive_menu
