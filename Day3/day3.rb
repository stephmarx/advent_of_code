class Trip
  attr_accessor :houses

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
      puts "Character is #{char}."
      print_manifest

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

      print_manifest

      deliver_present_to_house
    end
  end

  def deliver_present_to_house
    # print_manifest
    @houses.each do |house|
      if house.position == @position
        house.deliver_present
        puts "I have delivered one present to the house at #{house.position}."
        return nil
      end
    end

    @houses << House.new(@position)
    puts "I have created a new house at #{@position}"
    print_manifest
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

trip = Trip.new("><")




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
