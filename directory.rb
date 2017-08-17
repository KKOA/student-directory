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
  current_pos = 0
  namesLength = names.length
  while current_pos < namesLength #loop while current pos less length of names array
    if(names[current_pos][:name].length < 12 && names[current_pos][:name][0].downcase == "a") #output if :name is less than 12 characters and begins with specific character
      puts "#{current_pos+1}. #{names[current_pos][:name]} (#{names[current_pos][:cohort]} cohort)"
    end
    current_pos += 1
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
