class Trip
  def initialize(instructions)
    @instructions = instructions
    @houses = []
    @position = [0, 0]

    puts "ONE"
    puts @houses
    deliver_presents
    print_manifest
  end

  def deliver_presents
    puts "TWO"
    puts @houses

    @instructions.split("").each do |char|
      puts "THREE"
      puts @houses
      puts "GOING TO THE #{char}"

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

      puts "FOUR"
      puts @houses
      deliver_present_to_house
    end
  end

  def deliver_present_to_house
    @houses.each do |house|
      if house.position == @position
        puts "DELIVERING TO EXISTING HOUSE"
        house.deliver_present
        return
      end
    end

    puts "DELIVERING TO NEW HOUSE"
    @houses << House.new(@position)
  end

  def print_manifest
    @houses.each do |house|
      puts "The house at (#{house.position[0]}, #{house.position[1]}) got #{house.presents}."
    end
  end

end

class House
  attr_accessor :position, :presents

  def initialize(position)
    @position = position
    @presents = 1
  end

  def deliver_present
    @presents += 1
  end

end

trip = Trip.new("<>")
