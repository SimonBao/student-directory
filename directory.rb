#input_students prompts user guide and prompts for a student name
#name obtained is pushed to students Array in a hash format with the current cohort
def input_students
  puts 'Please enter the name of the students.'
  puts 'To finish, just hit return twice.'
  students = []
  name = gets.chomp
  #until name is empty it keeps running. 'until name.empty?' also could be used.
  while !name.empty? do
    students << {name: name, cohort: 'november'}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_footer(students)
  print "Overall, we have #{students.count} great students.\n"
end

def prints(students)
  # each method iterates through each student in students Array.
  # and puts their name and cohort out.
  starts_with = /s/
  students.each_with_index do |student, idx|
    puts "#{idx+1}.#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)" if (student[:name])[0].match(starts_with)
  end
end



students = input_students
print_header
prints(students)
print_footer(students)
