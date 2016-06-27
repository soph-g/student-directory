
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete!("\n")

  # while the name is empty, repeat this code
  while !name.empty? do
    months = [ "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December"]
    puts "Which cohort does this student belong to?"
    cohort = gets.chomp.downcase
    if cohort.empty?
      cohort = "November"
    end
    while !months.include?(cohort.capitalize) do
      puts "That is not a valid cohort, please try again:"
      cohort = gets.chomp.downcase
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the next student, or hit enter to finish"
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print(students)
  cohorts = []
  students.map do |student|
    cohorts << student[:cohort]
  end
  cohorts.sort!
  previous_cohort = ""
  if students.length > 0
    cohorts.each do |cohort|
      if cohort != previous_cohort
        students.each do |student|
          if student[:cohort] == cohort
            puts "#{student[:name]} (#{student[:cohort]} cohort)"
          end
        end
        previous_cohort = cohort
      end
    end
  else
    puts "There are no students enrolled!"
  end
end

def print_footer(students)
  if students.count > 1
    puts "Overall we have #{students.count} great students"
  elsif students.count == 1
    puts "Overall we have #{students.count} great student"
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
