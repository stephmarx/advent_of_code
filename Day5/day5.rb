DISALLOWED = %w(ab cd pq xy)

class StringList
  def initialize(filename)
    @strings = File.readlines(filename)
    @nice_strings = 0

    count_nice_strings
    present_nice_string_count
  end

  def count_nice_strings
    @strings.each do |string|
      if string.is_nice?
        @nice_strings += 1
      end
    end
  end

  def present_nice_string_count
    puts "There are #{@nice_strings} nice strings."
  end
end

class String
  def is_nice?
    three_vowels? && double_letters? && !disallowed_strings?
  end

  private

  def three_vowels?
    self.scan(/[aeiou]/).length >= 3
  end

  def double_letters?
    self.length != self.squeeze.length
  end

  def disallowed_strings?
    DISALLOWED.any? {|string| self.match(string)}
  end

end

strings = StringList.new('input.txt')

# puts "zgsnvdmlfuplrubt".is_nice?
