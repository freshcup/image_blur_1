class Image
  def initialize (rows)
    @img = rows
  end


  def find_ones
    r_counter = 0
    location = []
    @img.each do |row|
      
      c_counter = 0
      row.each do |pixel|
        if pixel == 1
          location << [r_counter, c_counter]
        end
        c_counter = c_counter + 1
      end 
        r_counter = r_counter + 1
    end
    return location
  end

  def image_blur
    locations = find_ones
    locations.each do |location|
      column = location[1]
      row = location[0]
      if has_left?(location)
        @img[row][column-1] = 1
      end 
      if has_right?(location)
        @img[row][column+1] = 1
      end
      if has_top?(location)
        @img[row-1][column] = 1
      end
      if has_bottom?(location)
        @img[row+1][column] = 1
      end
    end
  end   
    
  def has_left?(location)
    column = location[1]
    if 0 < column 
      return true
    else
      return false  
    end 
  end

  def has_right?(location)
    column = location[1]
    row = location[0]
    lastcell = @img[row].length-1
    if lastcell > column 
      return true
    else
      return false
    end
  end 

  def has_top?(location)
    row = location[0]
    if 0 < row 
      return true
    else
      return false
    end 
  end

  def has_bottom?(location)
    column = location[1]
    row = location[0]
    lastrow = @img.length-1
    if lastrow > row 
      return true
    else
      return false
    end 
  end
        
  def blur(distance=1)
    distance.times do
      image_blur
  end


  end

  def output_image
    @img.each do |row|
      row.each do |pixel|
        print pixel 
      end
      print "\n"
    end
  end
end



image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
])
image.output_image
puts "Enter a distance."
val1 = gets.chomp
val2 = val1.to_i

image.blur(val2)
image.output_image

