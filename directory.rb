#Creation a Array which stores all students and deleted student_count
students = [
 'Dr. Hannibal Lecter',
 'Darth Vader',
 'Nurse Ratched',
 'Micheal Corleone',
 'Alex DeLarge',
 'The Wicked Witch of the West',
 'Terminator',
 'Freddy Kruger',
 'The Joker',
 'Joffrey Baratheon',
 'Norman Bates'
]


#Prints out the total amount of students enrolled, the number is still static but now attached to a variable and can be easily changed.
#The code also got refactored and student count is now interpolation is used.
puts 'The students of Villains Academy'
puts '-------------'
students.each { |student| puts student  }
print "Overall, we have #{students.count} great students.\n"
