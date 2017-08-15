#Added array to hold students
students =
[
  "Dr. Hannibal Lector",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
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
    puts name
  end
end

def print_footer(names) # Takes array of students and return number students using count method in a message
  puts "Overall, we have #{names.count} great students"
end

#call methods
print_header()
print(students)
print_footer(students)
