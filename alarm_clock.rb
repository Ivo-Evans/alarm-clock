require 'time'

def alarm_initiation
  puts "\n\nInput options:
  - desired alarm-ring time (FORMAT: 6:30 for the morning, 18:30 for the evening)
  - 'current' to see the current time according to your computer
  - 'end' to exit the program
  - ctrl-c at any point to force-abort the program\n\n"

  alarm
end

def alarm
  wait ensure_futurity verify_w_human verify_w_computer process_text gets.chomp
  ring
end

def process_text(input)
  case input
  when "current"
    puts Time.now.strftime "%A %H:%M"
    alarm
  when "end"
    exit(0)
  else
    input
  end
end

def verify_w_computer(input)
  begin
    time_object = Time.parse(input)
  rescue ArgumentError
    puts "unrecognised input\n"
    alarm
  end
  time_object
end

def verify_w_human(time_object)
  puts "is #{time_object.strftime "%A %H:%M"} your desired time?"
  answer = gets.chomp.downcase
  if answer.include?('y')
    time_object
  elsif answer.include?('n')
    puts "let's try again\n"
    alarm
  else
    puts "incomprehensible input\n"
    alarm
  end
end

def ensure_futurity(time_object)
  case time_object <=> Time.now
  when 1
    time_object
  when -1
    puts "This time has already passed. Please enter a new time\n"
    alarm
  end
end

def wait(deadline)
  until Time.now == deadline
  end
end

def ring
  pigs_fly = false
  until pigs_fly
    puts "enter ctrl-C to turn off the alarm. If you snooze you lose."
    20.times do
      puts "\a"
      sleep rand 0..1.5
    end
  end
end

alarm_initiation

# another ring method, which doesn't scroll:

# def ring
#   pigs_fly = false
#   puts "enter ctrl-C to turn off the alarm. If you snooze you lose."
#   until pigs_fly
#     print "\a"
#     sleep rand 0..1.5
#   end
# end
