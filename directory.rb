#Define methods
def input_students #method allows the user dynamically input students
  students = [] #empty array
  all_cohorts =['januay','february','march','april','may','june','july','august','september','october','nov','december']
  puts("Please enter a student name. Hit enter twice to exit")
  name = gets.strip #Get user input and remove leading and trailing whitespaces
  name = name.split(" ").map{|x| x.capitalize}.join(" ") # capitalize first letter of each word e.g. aaron smith => Aaron Smith
  until name.empty? do #repeat code while name is not empty
    puts("Please enter the cohort month name (i.e august)")
    puts("that the student belong to or leave blank for current month")
    cohort = gets.strip.downcase
    until all_cohorts.include?(cohort)
      if(cohort.length == 0)
        cohort = Time.now.strftime("%B").downcase
        break
      end
      puts("#{cohort} is an invalid cohort month name")
      puts("Please enter the cohort month name that the student belong to")
      cohort = gets.strip.downcase
    end
    puts("Please enter your hobbies")
    hobbies =gets.strip
    puts("Please enter Country of Birth")
    country_of_birth = gets.strip
    puts("Please enter your height in cm")
    height =gets.strip.to_i
    students << {:name => name, :cohort => cohort.to_sym, :hobbies => hobbies ,:country_of_birth => country_of_birth, :height => height} #add ended of array
    msg = "Now we have #{students.count} student"
    msg << "s" if students.count > 1
    puts(msg,"")
    puts("Please enter another student name. Hit enter twice to exit")
    name = gets.strip #ask user for another, also need to prevent infinite loop
  end
  return students # return array
end

def print_header #output the header
  puts ""
  puts("The students of Villians Academy".center(70))
  puts(("-"*68).center(70))
end

def print(names) #This method overwrite existing print method
  current_pos = 0
  namesLength = names.length
  return nil if(namesLength == 0) #Prevent looping through students array if there are no students
  while(current_pos < namesLength) #loop while current pos less length of names array
    if((names[current_pos][:name].length) < 12 && (names[current_pos][:name][0].downcase == "a")) #output if :name is less than 12 characters and begins with specific character
      puts("#{current_pos+1}. "+
           "#{names[current_pos][:name]} "+
           "(#{names[current_pos][:cohort]} cohort) "+
           "Hobbies: #{names[current_pos][:hobbies]} "+
           "Country of birth: #{names[current_pos][:country_of_birth]} "+
           "Height: #{names[current_pos][:height]} cm "
           )
    end
    current_pos += 1
  end
end

def print_footer(names) # Takes array of students and return number students using count method in a message
  puts("\nOverall, we have #{names.count} great students\n\n")
end

#call methods
print_header()
#Added array to hold students
students = input_students
print(students)
print_footer(students)
