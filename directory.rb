require "yaml"
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
    filename = assign_filename
    save_students(filename)
  when "4"
    filename = assign_filename
    load_students(filename)
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


def save_students(filename = "students.csv")
  File.open(filename, "w") do |file|
    file.write(@students.to_yaml)
  end
  puts "#{@students.count} students were saved to #{filename}"
end


def load_students(filename = "students.csv")
  @students = []
  @students = YAML::load(File.read(filename))
  puts "#{@students.count} students were loaded from #{filename}"
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

def assign_filename
  puts "Please give a filename"
  puts "Leave blank to use students.csv"
  filename = gets.chomp
end



def create_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# nothing happens until we call the methods
try_load_students
interactive_menu
