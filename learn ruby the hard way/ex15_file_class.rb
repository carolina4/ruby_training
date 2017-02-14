filename = ARGV.first

puts "Here is your file #{filename}"

txt = File.read(filename)
puts txt

print "Type the filename again: "
file_again = $stdin.gets.chomp

txt = File.read(file_again)
puts txt