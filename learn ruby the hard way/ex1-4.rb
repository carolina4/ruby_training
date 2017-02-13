puts "Hello world"
puts "This is fun"
puts "I'd rather you 'not'"
puts 'I "said" do not touch this.'
puts "This is fun\n\n"

# this is a comment
puts "I will now count my chickens:"
puts "Hens #{25 + 30 / 6}"
puts "Roosters #{100 - 25 * 3 % 4}"

puts "Now I will count the eggs:"
puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

puts "Is it true that 3 + 2 < 5 - 7?"
puts 3 + 2 < 5 - 7

puts "What is 3 + 2? #{3 + 2}"
puts "What is 5 - 7? #{5 - 7}"

puts "Oh, that's why it's false."

cars = 100
puts "There are #{cars} cars available."

inches = 5.0
centimeters = inches * 2.54

puts "#{inches}inches is equal to #{centimeters}cm."

puts %q{
There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
}

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

puts fat_cat