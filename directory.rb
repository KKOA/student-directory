#Define methods
def input_students #method allows the user dynamically input students
  students = [] #empty array
  puts "Please enter the names of the students. Hit enter twice to exit"
  name = gets.chomp #Get user input
  until name.empty? do #repeat code while name is not empty
    students << {:name => name, :cohort => :november} #add ended of array
    puts "Now we have #{students.count} students"
    puts "Please enter another names of the students. Hit enter twice to exit"
    name = gets.chomp #ask user for another, also need to prevent infinite loop
  end
  return students # return array
end

def print_header #output the header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(names) #This method overwrite existing print method
  # Takes an array of students.
  #Outputs each student by using each block parameter (|name|) to iterate over the student array
  names.each do | name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer(names) # Takes array of students and return number students using count method in a message
  puts "Overall, we have #{names.count} great students"
end

#call methods
print_header()
#Added array to hold students
students = input_students
print(students)
print_footer(students)
