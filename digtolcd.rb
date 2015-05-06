# Returns number with calculator-face
# Example call digtolcd.rb 123
# Result:
#    _   _
# |  _|  _|
# | |_   _|

module DigToLCD

  def self.print_number(num)
    arr = num.to_s.split('').map(&:to_i)
    ver = '|'
    hor = '_'

    puts get_first_string(arr, hor, ver)
    puts get_second_string(arr, hor, ver)
    puts get_third_string(arr, hor, ver)
  rescue => exception
    puts "Error! #{exception.inspect}"
  end

  def self.get_first_string(arr, hor, ver)
    arr.inject('') do |result, number|
      result +=  [1,4].include?(number) ? '   ' : " #{hor} "
      result + ' '
    end
  end

  def self.get_second_string(arr, hor, ver)
    arr.inject('') do |result, number|
      result +=
          case number
            when 0
              "#{ver} #{ver} "
            when 1,7
              "  #{ver} "
            when 2,3
              " #{hor}#{ver} "
            when 4,8,9
              "#{ver}#{hor}#{ver} "
            when 5,6
              "#{ver}#{hor}  "
            else
          end
    end
  end

  def self.get_third_string(arr, hor, ver)
    arr.inject('') do |result, number|
      result +=
          case number
            when 0,6,8
              "#{ver}#{hor}#{ver} "
            when 1,4,7
              "  #{ver} "
            when 2
              "#{ver}#{hor}  "
            when 3,5,9
              " #{hor}#{ver} "
            else
          end
    end
  end
end

DigToLCD.print_number(ARGV.first.to_i)
