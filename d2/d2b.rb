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

# a method for determining how many feet of ribbon the elves will need for their order
def ribbon_ft(filename)
  # gets the array of input data from read_file
  ribbon_data = read_file(filename)
  # sets intial total ribbon needed to 0
  total_ribbon = 0
  # iterates through each line of the input data and assigns to a giftbox variable
  ribbon_data.each do |giftbox|
    # takes each giftbox and splits it into an array of three elements (exl 'x')
    gift_dimensions = giftbox.split("x")
    # takes the above array and turns it into a hash with keys corresponding to dimensions and values corresponding to the indices
    dimensions_hash = create_dimensions_hash(gift_dimensions)
    # adds length (plus bow surplus) of each giftbox to the total ribbon needed
    total_ribbon += length_plus(dimensions_hash)
  end
  puts "The elves will need #{total_ribbon} feet of ribbon"
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

# a method to determine the length of ribbon each box will need plus how much extra is needed for the bow
def length_plus(dimensions_hash)
  # mutliplies the dimensions_hash value at key l by 2 and adds it to the dimensions_hash value at key w multiplied by 2
  perim1 = (2 * dimensions_hash[:l]) + (2 * dimensions_hash[:w])
  # mutliplies the dimensions_hash value at key w by 2 and adds it to the dimensions_hash value at key h multiplied by 2
  perim2 = (2 * dimensions_hash[:w]) + (2 * dimensions_hash[:h])
  # mutliplies the dimensions_hash value at key h by 2 and adds it to the dimensions_hash value at key l multiplied by 2
  perim3 = (2 * dimensions_hash[:h]) + (2 * dimensions_hash[:l])
  # finds the smallest number of the resulting above values
  min_perim = [perim1, perim2, perim3].min
  # calculates the volume of the giftbox in order to determine how much ribbon is needed for the bow
  volume = dimensions_hash[:l] * dimensions_hash[:w] * dimensions_hash[:h]
  # calculates the total perimeter of the giftbox and adds in the amount needed for the bow
  perim = volume + min_perim
  return perim
end

puts ribbon_ft("input.txt")
