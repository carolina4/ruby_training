print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets.chomp
print "How much do you weigh? "
weight = gets.chomp

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."
puts ""

print "Now, give me a number: "
number = gets.chomp.to_i
puts "Your number squared is #{number ** 2}"