# receives many arguments, prints the first 2
def print_two(*args)
    arg1, arg2 = arguments      # unpacking of arguments
    puts "arg1: #{arg1}, arg2: #{arg2}"
end

# receives just 2 arguments
def print_two_again(arg1, arg2)
    puts "arg1: #{arg1}, arg2: #{arg2}"
end

# one argument
def print_one(arg1)
    puts "arg1: #{arg1}"
end

# no argument
def print_none()
    puts "I got nothing."
end

print_two("Zed","Shaw")
print_two_again("Zed","Shaw")
print_one("First!")
print_none()