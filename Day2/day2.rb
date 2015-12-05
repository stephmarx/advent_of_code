class PresentList
  def initialize(filename)
    @raw_list = File.readlines(filename)
    @presents = []

    create_presents
    puts total_paper_required
    puts total_ribbon_required
  end

  def create_presents
    @raw_list.each do |present|
      present_dimensions = present.split("x").map(&:to_i)
      @presents << Present.new(present_dimensions)
    end
  end

  def total_paper_required
    paper_total = 0

    @presents.each do |present|
      paper_total += present.required_paper
    end

    paper_total
  end

  def total_ribbon_required
    ribbon_total = 0

    @presents.each do |present|
      ribbon_total += present.required_ribbon
    end

    ribbon_total
  end
end

class Present
  attr_accessor :required_paper, :required_ribbon

  def initialize(present_dimensions)
    @length = present_dimensions[0]
    @width = present_dimensions[1]
    @height = present_dimensions[2]
    @areas_of_sides = determine_areas_of_sides
    @perimeters_of_sides = determine_perimeters_of_sides
    @required_paper = calculate_required_paper
    @required_ribbon = calculate_required_ribbon
  end

  def determine_areas_of_sides
    areas = []
    areas << area_of_side(@length, @width)
    areas << area_of_side(@width, @height)
    areas << area_of_side(@height, @length)
    areas
  end

  def determine_perimeters_of_sides
    perimeters = []
    perimeters << perimeter_of_side(@length, @width)
    perimeters << perimeter_of_side(@width, @height)
    perimeters << perimeter_of_side(@height, @length)
    perimeters
  end

  def calculate_required_paper
    2*(@areas_of_sides.inject(:+)) + area_of_smallest_side
  end

  def area_of_side(a, b)
    a * b
  end

  def perimeter_of_side(a, b)
    2 * a + 2 * b
  end

  def area_of_smallest_side
    @areas_of_sides.min
  end

  def smallest_perimeter
    @perimeters_of_sides.min
  end

  def calculate_required_ribbon
    smallest_perimeter + volume
  end

  def volume
    @length * @width * @height
  end

end

list = PresentList.new('present_list.txt')

# ham = Present.new([1, 1, 10])
# puts ham.required_ribbon
