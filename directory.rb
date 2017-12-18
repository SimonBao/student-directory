def input_student
  print 'Student name: '
  name = STDIN.gets.chomp
  until name.empty? do
    cohort, hobby, country, height = student_details
    @students << {name: name.capitalize.to_sym,
                 cohort: cohort.capitalize.to_sym,
                 hobby: hobby.capitalize.to_sym,
                 country: country.capitalize.to_sym,
                 height: height}
    print "Current Student Count: #{@students.count}\n"
    print 'Student name:'
    name = STDIN.gets.chomp
  end
  print 'Choose Option => '
end

def student_details
  print 'Student cohort: '
  cohort = STDIN.gets.gsub!(/[\s]/, '')
  print 'Student hobby: '
  hobby = STDIN.gets.chomp
  print 'Student country: '
  country = STDIN.gets.chomp
  print 'Student height: '
  height = STDIN.gets.chomp
  check_answer(cohort, hobby, country, height)
end

def check_answer(cohort, hobby, country, height)
  cohort = 'None' if cohort.empty?
  hobby = 'None' if hobby.empty?
  country = 'None' if country.empty?
  height = 'None' if height.empty?
  return cohort, hobby, country, height
end

def print_header
  puts 'Students of Villains Academy'.center(100)
  puts '--------------'.center(100)

end

def prints
  @students.each do |student|
    print student.map { |key, value| "#{key}: #{value}" }.join(', ').center(100)
    puts
  end
end

def print_footer
  puts '--------------'.center(100)
  if @students.count > 1
    puts "We have #{@students.count} great students.".center(100)
  elsif @students.count.zero?
    puts "Sadly we have #{@students.count} students.".center(100)
  else
    puts "We have #{@students.count} great student.".center(100)
  end
end

def menu_options
  puts
  puts 'Option 1) Enroll New Students'
  puts 'Option 2) Print Academy Students'
  puts 'Option 3) Menu Options'
  puts 'Option 4) Save student details to database'
  puts 'Option 5) Load student database'
  puts 'Option 9) Quit'
  choose_option
end

def print_students
  print_header
  prints
  print_footer
  choose_option
end

def save_students
  #Opens up a file called 'students.csv' and write to it 'w'. If the file does not exist, it creates it.
  file = File.open('students.csv', 'w')
  # Iteration through every single student
  @students.each do |student|
    student_data = [student[:name], student[:cohort]].join(', ')
    file.puts(student_data)
    # csv_line = student_data.join(', ') Original code provided
    # file.puts(csv_line)                Original code provided
  end
  choose_option
  file.close
end

def choose_option
  print 'Choose Option => '
end

def try_load_students
  filename = ARGV.first #This would be the first argument passed in the command line
  return if filename.nil? #stop method here and return nil if there is no argument passed
  if File.exist?(filename) # if arguement is passed and there is a file that matches the arguement continue
    load_students(filename, true) #passes the filename to load_students and overrites default 'student.csv'
    puts "Total students #{@students.count} added."
  else
    puts "Sorry, file '#{filename}' does not exist."
    if File.exist?('students.csv')
      load_students('students.csv', true)
      puts "Total students #{@students.count} added from file 'students.csv'."
    end
  end
end

def load_students(filename = 'students.csv', start=false )
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  start ? nil : choose_option
  file.close
end

def menu
  menu_options
  loop do
    user_input = STDIN.gets.chomp
    case user_input
      when '1'
        input_student
      when '2'
        print_students
      when '3'
        menu_options
      when '4'
        save_students
      when '5'
        load_students
      when '9'
        exit
    end
  end
end

@students = []
try_load_students
menu
