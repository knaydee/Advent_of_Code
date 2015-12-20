# a method to open and read the input data as an array
def read_file(filename)
  # empty array for input data
  data = []
  # is for read only - starts at beginning of file
  f = File.open(filename, "r")
    # goes through each line of the file and pushes it to data array
    f.each_line do |line|
      data.push(line)
    end
  # returns data set with lines pushed in during above code
  return data
end

# a method for determining how many square feet of wrapping paper the elves will need for their order
def wrapping_sf(filename)
  # gets the array of input data from read_file
  wrapping_data = read_file(filename)
  # sets intial total wrapping paper needed to 0
  total_wrapping = 0
  # iterates through each line of the input data and assigns to a giftbox variable
  wrapping_data.each do |giftbox|
    # takes each giftbox and splits it into an array of three elements (exl 'x')
    gift_dimensions = giftbox.split("x")
    # takes the above array and turns it into a hash with keys corresponding to dimensions and values corresponding to the indices
    dimensions_hash = create_dimensions_hash(gift_dimensions)
    # adds surface area (plus slack) of each giftbox to the total wrapper paper needed
    total_wrapping += surface_area_plus(dimensions_hash)
  end
  puts "The elves will need #{total_wrapping} square feet of wrapping paper"
end

# a method to create a dimensions hash with keys for length(l), width(w), height(h) and corresponding values equal to the first 3 indices of of each gift
def create_dimensions_hash(gift_dimensions)
  # creates an empty hash
  dimensions_hash = {}
  # creates a dimensions_hash k, v pair; assigns a length key to a value equal to the first element in the giftbox array (converting it to an integer)
  dimensions_hash[:l] = gift_dimensions[0].to_i
  # creates a dimensions_hash k, v pair; assigns a width key to a value equal to the second element in the giftbox array (converting it to an integer)
  dimensions_hash[:w] = gift_dimensions[1].to_i
  # creates a dimensions_hash k, v pair; assigns a height key to a value equal to the third element in the giftbox array (converting it to an integer)
  dimensions_hash[:h] = gift_dimensions[2].to_i
  # returns the resulting dimensions_hash
  return dimensions_hash
end

# a method to determine the surface area of each gift box plus how much extra the elves will need for slack
def surface_area_plus(dimensions_hash)
  # mutliplies the dimensions_hash value at key l with the dimensions_hash value at key w
  lw = dimensions_hash[:l] * dimensions_hash[:w]
  # mutliplies the dimensions_hash value at key w with the dimensions_hash value at key h
  wh = dimensions_hash[:w] * dimensions_hash[:h]
  # mutliplies the dimensions_hash value at key h with the dimensions_hash value at key l
  hl = dimensions_hash[:h] * dimensions_hash[:l]
  # finds the smallest number of the resulting above values
  min_sa = [lw, wh, hl].min
  # calculates the total surface area of the giftbox and adds in the amount needed for slack
  sa = (2 * lw) + (2 * wh) + (2 * hl) + min_sa
  return sa
end

puts wrapping_sf("input.txt")

# def wrapping_needed(filename)
#   gift_data = file_read(filename)
#   total_wrapping = 0
#   gift_data.each do |gift|
#     present_dimensions = gift.split("x")
#     dims_hash = dimensions_hash(present_dimensions)
#     total_wrapping += wrap_calc(dims_hash)
#   end
#   return total_wrapping
# end
#
#
# def wrap_calc(dims)
#   lw = dims[:length] * dims[:width]
#   wh = dims[:width] * dims[:height]
#   hl = dims[:height] * dims[:length]
#   min_sa = [lw, wh, hl].min
#   sa_box = (2 * lw) + (2 * wh) + (2 * hl) + min_sa
#   return sa_box
# end
#
