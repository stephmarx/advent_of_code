class Trip
  attr_accessor :houses, :position

  def initialize(filename)
    @instructions = File.open(filename, "rb").read
    @houses = []
    @position = [0, 0]

    @houses << House.new([0, 0])
    deliver_presents
    print_house_count
  end

  def deliver_presents
    @instructions.split("").each do |char|
      move_position(char)
      deliver_present_to_house
    end
  end

  def move_position(char)
    case char
    when "<"
      @position[0] -= 1
    when ">"
      @position[0] += 1
    when "^"
      @position[1] += 1
    when "v"
      @position[1] -= 1
    end
  end

  def deliver_present_to_house
    @houses.each do |house|
      if house.position == @position
        house.deliver_present
        return nil
      end
    end

    @houses << House.new(@position.clone)
  end

  def print_manifest
    @houses.each do |house|
      puts "The house at #{house.position} has #{house.presents} presents."
    end
  end

  def print_house_count
    puts "#{@houses.length} houses received at least one present."
  end

end

class House
  attr_reader :position, :presents

  def initialize(position)
    @position = position
    @presents = 1
  end

  def deliver_present
    @presents += 1
  end

end

trip = Trip.new('input.txt')
