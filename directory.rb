#Added array to hold students
students =
[
  {:name =>"Dr. Hannibal Lector", :cohort => :november},
  {:name =>"Darth Vader", :cohort => :november},
  {:name =>"Nurse Ratched", :cohort => :november},
  {:name =>"Michael Corleone", :cohort => :november},
  {:name =>"Alex DeLarge", :cohort => :november},
  {:name =>"The Wicked Witch of the West", :cohort => :november},
  {:name =>"Terminator", :cohort => :november},
  {:name =>"Freddy Krueger", :cohort => :november},
  {:name =>"The Joker", :cohort => :november},
  {:name =>"Joffrey Baratheon", :cohort => :november},
  {:name =>"Norman Bates", :cohort => :november}
]

#Define methods
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
print(students)
print_footer(students)
