# a method for determining what floor the instructions ultimately take Santa to
def directions
  # r is for read only - starts at beginning of file
  f = File.open("input.txt", "r").read
  # Santa starts on the ground floor of the apartment building
  floor = 0
  # split each string in f array into individual characters
  f.split("").each do |char|
    # if the character is an open parentheses, add 1 to floor
    if char == "("
      floor += 1
    # otherwise, if the character is a closed parentheses, subtract 1 from floor
    elsif char == ")"
      floor -= 1
    end
  end
    puts "Santa's instuctions take him to floor #{floor}"
end

directions


# def read_file(filename)
#   # empty array for input data
#   data = []
#   # is for read only - starts at beginning of file
#   f = File.open(filename, "r")
#     # goes through each line of the file and pushes it to data
#     f.each_line do |line|
#       data.push(line)
#     end
#   return data
# end
#
# def building_floor(filename)
#   # array of the lines in the file read in read_file
#   data = read_file(filename)
#   floor = 0
#   # goes through each line in array and splits it into separate elements
#   data.each do |line|
#     # goes through each index in the array and assigns it to a variable called index
#     line.split("").each do |index|
#       if index == "("
#         floor += 1
#       # using 'else' produces an answer that is 1 less the correct answer.  Not sure why?
#       elsif index == ")"
#         floor -= 1
#       end
#     end
#     return floor
#   end
# end
#
# puts building_floor("input.txt")
