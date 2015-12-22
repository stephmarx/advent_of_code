VOWELS = "aeiou"

class StringList
  def initialize(filename)
    @strings = File.readlines(filename)
    @nice_strings = 0

    puts @strings.length

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
    nice = false
    naughty = false
    num_vowels = 0
    prev_letter = 0

    self.split("").each do |letter|
      if VOWELS.include?(letter)
        num_vowels += 1
      end

      if letter == prev_letter
        nice = true
      end

      if (prev_letter == "a" && letter == "b") || (prev_letter == "c" && letter == "d") || (prev_letter == "p" && letter == "q") || (prev_letter == "x" && letter == "y")
        naughty = true
      end

      prev_letter = letter.clone
    end

    if num_vowels >= 3
      nice = true
    else
      naughty = true
    end

    if naughty == true
      return false
    elsif nice == false
      return false
    elsif nice == true
      return true
    end
  end
end

strings = StringList.new('input.txt')

# puts "zgsnvdmlfuplrubt".is_nice?
