# a method for determining the position in the instructions at which Santa goes to first floor of the basement
def position
  # r is for read only - starts at beginning of file
  f = File.open("input.txt", "r").read
  # Santa starts on the ground floor of the apartment building
  floor = 0
  # split each string in f array into hash with a key of char and value of index
  f.split("").each_with_index do |char, index|
  # run below if loop until floor equals -1
  until floor == -1
    # if the character is an open parentheses, add 1 to floor
    if char == "("
      floor += 1
    # otherwise, if the character is a closed parentheses, subtract 1 from floor
    elsif char == ")"
      floor -= 1
    end
      # add 1 to index since the instructions start at position 1 (array indices start at 0)
      puts "Santa goes into the basement at step #{index + 1} of the instructions"
  end
end

position

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
#   # Santa starts on the ground floor
#   floor = 0
#   basement = 0
#   # goes through each line in array and splits it into separate elements
#   data.each do |line|
#     # goes through each index in the array and assigns it to a variable called char and also returns it's index (position in the array)
#     line.split("").each_with_index do |char, index|
#       if char == "("
#         floor += 1
#       elsif char == ")"
#         floor -= 1
#       end
#       # when floor equals -1, we know Santa is below ground floor and on the first/ground level of the basement
#       if floor == -1 && basement == 0
#         # because
#         basement = index + 1
#       end
#     end
#   end
#   return basement
# end
#
# puts building_floor("input.txt")
