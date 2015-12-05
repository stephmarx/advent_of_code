class PresentList
  def initialize(filename)
    @raw_list = File.readlines(filename)
    @presents = []

    create_presents
    puts total_paper_required
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
end

class Present
  attr_accessor :required_paper

  def initialize(present_dimensions)
    @length = present_dimensions[0]
    @width = present_dimensions[1]
    @height = present_dimensions[2]
    @sides = determine_sides
    @required_paper = calculate_required_paper
  end

  def determine_sides
    sides = []
    sides << area_of_side(@length, @width)
    sides << area_of_side(@width, @height)
    sides << area_of_side(@height, @length)
    sides
  end

  def calculate_required_paper
    2*(@sides.inject(:+)) + area_of_smallest_side
  end

  def area_of_side(a, b)
    a * b
  end

  def area_of_smallest_side
    @sides.min
  end

end

list = PresentList.new('present_list.txt')
