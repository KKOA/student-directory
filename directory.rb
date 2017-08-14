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

#Outputted the list students from array
puts "The students of Villians Academy"
puts "-------------"
# Using the each method to iterate over the students array, storing the current element in temporary variable called student which we can output each student

students.each do | student|
  puts student
end

# Unlike puts, print does not add new character so have use escape character (\n)
# Using array.count method to count the number of students rather than hard coding the value
puts "Overall, we have #{students.count} great students"
