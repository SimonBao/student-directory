#input_students prompts user guide and prompts for a student name
#name obtained is pushed to students Array in a hash format with the current cohort
def input_students
  puts 'Please enter the name of the students.'
  puts 'To finish, just hit return twice.'
  students = []
  name = gets.chomp
  #until name is empty it keeps running. 'until name.empty?' also could be used.
  while !name.empty? do
    hobbies, country, height = more_info
    students << {name: name, cohort: 'november', hobby: hobbies, origin: country, height: height}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def more_info
  print 'What is your hobby: '
  hobby = gets.chomp
  print "What is your country: "
  country = gets.chomp
  print "hat is your height in cm: "
  height = gets.chomp
  return hobby, country, height
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
  # print 'Search by letter: '
  # starts_with = gets.chomp
  students.each_with_index do |student, idx|
    # puts "#{idx+1}.#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)"  if starts_with.match((student[:name])[0])
    print "#{idx}."
    student.each do |k, v|
      print "#{k}: #{v}, "
    end
    puts
  end
end



students = input_students
print_header
prints(students)
print_footer(students)
