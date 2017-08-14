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
puts students[0]
puts students[1]
puts students[2]
puts students[3]
puts students[4]
puts students[5]
puts students[6]
puts students[7]
puts students[8]
puts students[9]
puts students[10]

# Unlike puts, print does not add new character so have use escape character (\n)
# Using array.count method to count the number of students rather than hard coding the value
puts "Overall, we have #{students.count} great students"
