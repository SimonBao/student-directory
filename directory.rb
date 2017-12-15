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
  print 'Search by letter: '
starts_with = gets.chomp
  total_students = 0
  until total_students == students.count
    if starts_with.match(((students[total_students])[:name])[0])
      puts "#{total_students+1}.#{(students[total_students])[:name].capitalize} (#{(students[total_students])[:cohort].capitalize})"
    end
    total_students += 1
  end
end



students = input_students
print_header
prints(students)
print_footer(students)
