# require 'pry-byebug'

class Trip
  attr_accessor :houses, :position

  def initialize(instructions)
    @instructions = instructions
    @houses = []
    @position = [0, 0]

    @houses << House.new([0, 0])
    deliver_presents
    print_manifest
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

trip = Trip.new("vv")




# steve = House.new([0, 0])
# # steve.deliver_present
# # steve.deliver_present
#
# karen = House.new([0, 1])
# # karen.deliver_present
#
# houses = [steve, karen]
#
# position = [0, 0]
# houses.each do |house|
#   if house.position == position
#     house.deliver_present
#   end
# end
#
# houses.each do |house|
#   puts house.presents
# end
