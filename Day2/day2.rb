# array_of_presents = File.readlines('present_list.txt')
# array_of_presents.each_with_index do |present, index|
#   array[index] = present.split("x")
# end

class PresentList
  def initialize(filename)
    @raw_list = File.readlines('#{filename}')
    @presents = []

    create_presents
  end

  def create_presents
    @raw_list.each do |present|
      present_dimensions = present.split("x").map(&:to_i)
      @presents << Present.new(present_dimensions)
    end
  end
end

class Present
  attr_accessor :required_paper

  def initialize(present_dimensions)
    @length = present_dimensions[0]
    @width = present_dimensions[1]
    @height = present_dimensions[2]
    @side_1_area = area_of_side(@length, @width)
    @side_2_area = area_of_side(@width, @height)
    @side_3_area = area_of_side(@height, @length)
    @required_paper = calculate_required_paper
  end

  def calculate_required_paper
    return 2*(@side_1_area + @side_2_area + @side_3_area) + area_of_smallest_side
  end

  def area_of_side(a, b)
    a * b
  end

  def area_of_smallest_side
    [@side_1_area, @side_2_area, @side_3_area].min
  end

end

# ham = Present.new([2, 3, 4])
# puts ham.required_paper
