#Define methods
def input_students #method allows the user dynamically input students
  students = [] #empty array
  puts "Please enter the names of the students. Hit enter twice to exit"
  name = gets.chomp #Get user input
  until name.empty? do #repeat code while name is not empty
    puts "Please enter your hobbies"
    hobbies =gets.chomp
    puts "Please enter Country of Birth"
    country_of_birth = gets.chomp
    puts "Please enter your height in cm"
    height =gets.chomp.to_i
    students << {:name => name, :cohort => :november, :hobbies => hobbies ,:country_of_birth => country_of_birth, :height => height} #add ended of array
    msg = "Now we have #{students.count} student"
    msg << "s" if students.count > 1
    puts msg,""
    puts "Please enter another names of the students. Hit enter twice to exit"
    name = gets.chomp #ask user for another, also need to prevent infinite loop
  end
  return students # return array
end

def print_header #output the header
  puts ""
  puts "The students of Villians Academy".center(70)
  puts ("-"*68).center(70)
end

def print(names) #This method overwrite existing print method
  current_pos = 0
  namesLength = names.length
  while current_pos < namesLength #loop while current pos less length of names array
    if(names[current_pos][:name].length < 12 && names[current_pos][:name][0].downcase == "a") #output if :name is less than 12 characters and begins with specific character
      puts("#{current_pos+1}. "+
           "#{names[current_pos][:name]} "+
           "(#{names[current_pos][:cohort]} cohort) "+
           "hobbies: #{names[current_pos][:hobbies]} "+
           "country of birth: #{names[current_pos][:country_of_birth]} "+
           "height: #{names[current_pos][:height]} cm "
           )
    end
    current_pos += 1
  end
end

def print_footer(names) # Takes array of students and return number students using count method in a message
  puts ""
  puts "Overall, we have #{names.count} great students"
  puts ""
end

#call methods
print_header()
#Added array to hold students
students = input_students
print(students)
print_footer(students)
