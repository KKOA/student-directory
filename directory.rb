#Define methods
def input_students #method allows the user dynamically input students
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
        cohort = Time.now.strftime("%B").downcase # get the current month
        break
      end
      puts("#{cohort} is an invalid cohort month name")
      puts("Please enter the cohort month name that the student belong to")
      cohort = gets.strip.downcase
    end
    puts("Please enter your hobbies")
    hobbies =gets.strip
    puts("Please enter country of birth")
    country_of_birth = gets.strip
    puts("Please enter your height in cm")
    height =gets.strip.to_i
    @students << {:name => name, :cohort => cohort.to_sym, :hobbies => hobbies ,:country_of_birth => country_of_birth, :height => height} #add ended of array
    msg = "Now we have #{@students.count} student"
    msg << "s" if(@students.count > 1)
    puts(msg,"")
    puts("Please enter another student name. Hit enter twice to exit")
    name = gets.strip #ask user for another, also need to prevent infinite loop
  end
end

def print_header #output the header
  puts("", "The students of Villians Academy".center(70),("-"*68).center(70))
end

def print_student_lists
  current_pos = 0
  studentLength = @students.length
  return nil if(studentLength == 0) #Prevent looping through students array if there are no students
  while(current_pos < studentLength) #loop while current pos less length of student array
    if((@students[current_pos][:name].length) < 12 && (@students[current_pos][:name][0].downcase == "a")) #output if :name is less than 12 characters and begins with specific character
      puts("#{current_pos+1}. "+
           "#{@students[current_pos][:name]} "+
           "(#{@students[current_pos][:cohort]} cohort) "+
           "Hobbies: #{@students[current_pos][:hobbies]} "+
           "Country of birth: #{@students[current_pos][:country_of_birth]} "+
           "Height: #{@students[current_pos][:height]} cm "
           )
    end
    current_pos += 1
  end
end

def print_footer # Takes array of students and return number students using count method in a message
  puts("\nOverall, we have #{@students.count} great students\n\n")
end

def print_menu
  puts("","Menu".center(70),("-"*68).center(70))
  menu =['Input the students','Show students','','','','','','','Exit']
  menu.each_with_index do | menu_item, key |
    next if menu_item == '' # Do not display empty menu items
    puts("#{key+1}. #{menu_item}")
  end
end

def show_students
  print_header
  print_student_lists
  print_footer
end

def interactive_menu
  @students = [] #Define students array so menu option 2 can be called before menu option 1
  loop do
    print_menu #1 print the menu

    #2 read the input and save it into variable
    puts("","Please select an option ")
    selection = gets.strip

    #3 perform action
    case selection
    when "1"
      puts("")
      input_students
      msg = "#{@students.count} student"
      msg << "s" if @students.count > 1
      msg << " added"
      puts(msg)
    when "2"
      show_students
    when "9"
      break
    else
      puts("'#{selection}' is an invaid option. Please try again")
    end
  end
  puts("","Exiting Program","")
end

#start program
interactive_menu
