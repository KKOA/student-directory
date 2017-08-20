@students = [] #Define students array so menu option 2 can be called before menu option 1

#Define methods
def question_answer(question) #Takes question as input and return users input
  STDOUT.puts(question)
  return STDIN.gets.strip #Get user input and remove leading and trailing whitespaces
  #gets method reads from the list of files supplied as arguments, only defaulting to the keyboard (or, standard input stream, to be precise) if there are no files.
  #Because passing argument to file on startup, we need prepend gets with reference of STDIN for all place where we expecting user input from keyboard
end

def input_students #method allows the user dynamically input students
  all_cohorts =['january','february','march','april','may','june','july','august','september','october','november','december']
  name = question_answer("Please enter a student name. Hit enter twice to exit")
  until name.empty? do #repeat code while name is not empty
    name = name.split(" ").map{|x| x.capitalize}.join(" ") # capitalize first letter of each word e.g. aaron smith => Aaron Smith
    cohort = question_answer("Please enter the cohort month name (i.e august)\n that the student belong to or leave blank for current month").downcase
    until all_cohorts.include?(cohort)
      if(cohort.length == 0)
        cohort = Time.now.strftime("%B").downcase # get the current month
        break
      end
      STDOUT.puts("#{cohort} is an invalid cohort month name")
      cohort = question_answer("Please enter the cohort month name (i.e august) \nthat the student belong to or leave blank for current month").downcase
    end
    hobbies = question_answer("Please enter your hobbies")
    country_of_birth = question_answer("Please enter country of birth")
    height = question_answer("Please enter your height in cm")
    @students << {:name => name, :cohort => cohort.to_sym, :hobbies => hobbies ,:country_of_birth => country_of_birth, :height => height}
    #add ended of array
    msg = "Now we have #{@students.count} student"
    msg << "s" if(@students.count > 1)
    STDOUT.puts(msg,"")
    name = question_answer("Please enter another student name. Hit enter twice to exit")
    #ask user for another, also need to prevent infinite loop
  end
end

def print_header #output the header
  STDOUT.puts("", "The students of Villians Academy".center(70),("-"*68).center(70))
end

def print_student_lists
  current_pos = 0
  studentLength = @students.length
  return nil if(studentLength == 0) #Prevent looping through students array if there are no students
  while(current_pos < studentLength) #loop while current pos less length of student array
    if((@students[current_pos][:name].length) < 12 && (@students[current_pos][:name][0].downcase == "a")) #output if :name is less than 12 characters and begins with specific character
      STDOUT.puts("#{current_pos+1}. "+
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
  STDOUT.puts("\nOverall, we have #{@students.count} great students\n\n")
end

def print_menu
  STDOUT.puts("","Menu".center(70),("-"*68).center(70))
  menu =['Input the students','Show students','Save list to file','Load list from file','','','','','Exit']
  menu.each_with_index do | menu_item, key |
    next if menu_item == '' # Do not display empty menu items
    STDOUT.puts("#{key+1}. #{menu_item}")
  end
end

def show_students
  print_header
  print_student_lists
  print_footer
end

def save_students #save data to file
  filename = 'student.csv'
  file = File.open(filename,"w") # open file in write mode incidate by w
  # warning w overwrite an existing file if file & directory has write permission for current user& it also create the file already exist
  @students.each do|student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country_of_birth], student[:height]]
    csv_line = student_data.join(",") # merge as array
    file.puts(csv_line) # write to file
    #Ruby method puts that can be used in various situations. You must explicity call if want to write to file
    #By default Ruby  assumes that we want to write to standard output, if use puts without any reference
  end
  file.close #close file. Only writes to file once closed it
  STDOUT.puts "Closing File" # STDOUT.puts an puts are same
  STDOUT.puts "Data saved to #{filename}"
end

def load_students(filename="student.csv")
  file = File.open(filename,"r") #open file in read mode
  file.readlines.each do |line| #loop file one line at time
    name,cohort,hobbies,country_of_birth,height = line.chomp.split(',')# parallel assigment
    @students << {:name => name, :cohort => cohort.to_sym, :hobbies => hobbies ,:country_of_birth => country_of_birth, :height => height}
  end
  file.close #close file
  STDOUT.puts("Closing File")
  STDOUT.puts("Loaded #{@students.count} from #{filename}")
end

def process(selection)
  case selection
  when "1"
    STDOUT.puts("")
    input_students
    msg = "#{@students.count} student"
    msg << "s" if @students.count > 1
    msg << " added"
    STDOUT.puts(msg)
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    STDOUT.puts("","Exiting Program","")
    exit
  else
    STDOUT.puts("'#{selection}' is an invaid option. Please try again")
  end
end

def interactive_menu
  loop do
    print_menu #1. print the menu
    process(question_answer("Please select an option ")) #2. read the input and #3. perform action
  end
end

def try_load
  filename = ARGV.first #Get first value from ARGV array
  #This is a special array that contains all arguments passed to program on startup
  #E.g. ruby directory.rb foo - foo is stored in ARGV array
  return load_students if(filename.nil?) #no point continuing function if filename is nil
  if(File.exists?(filename))#check file exist
    load_students(filename)
  else #file does not exist
    STDOUT.puts("Sorry #{filename} does not exist.")
  end
end

#start program
try_load
interactive_menu
=begin
Future imporvements
Edit student's detail
Delete student's detail
Enable user control the filter on number records they can see
=end
