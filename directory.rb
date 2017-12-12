#Creation a Array which stores all students and deleted student_count
students = [
 {name: 'Dr. Hannibal Lecter', cohort: 'November'},
 {name: 'Darth Vader', cohort: 'November'},
 {name: 'Nurse Ratched', cohort: 'November'},
 {name: 'Micheal Corleone', cohort: 'November'},
 {name: 'Alex DeLarge', cohort: 'November'},
 {name: 'The Wicked Witch of the West', cohort: 'November'},
 {name: 'Terminator', cohort: 'November'},
 {name: 'Freddy Krueger', cohort: 'November'},
 {name: 'The Joker', cohort: 'November'},
 {name: 'Joffrey Baratheon', cohort: 'November'},
 {name: 'Norman Bates', cohort: 'November'}
]


#Prints out the total amount of students enrolled, the number is still static but
#now attached to a variable and can be easily changed.
#The code also got refactored and student count is now interpolation is used.
puts 'The students of Villains Academy'
puts '-------------'
students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
print "Overall, we have #{students.count} great students.\n"
