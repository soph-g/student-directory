
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  line_width = 60
  puts "The students of Villains Academy".center(line_width)
  puts "---------------".center(line_width)
end

def print(students)
  line_width = 60
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(line_width)
  end
end

def print_footer(students)
  line_width = 60
  puts "Overall we have #{students.count} great students".center(line_width)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
