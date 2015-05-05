#Выводит число как на циферблате калькулятора

def print_number(num)
  arr = num.to_s.split('').map{|i|i.to_i}
  ver = '|'
  hor = '_'

  first_string = arr.inject('') do |result, x|
    result +=  [1,4].include?(x) ? '   ':" #{hor} "
    result + ' '
  end

  second_string = arr.inject('') do |result, x|
    case x
      when 0
        result += "#{ver} #{ver}"
      when 1,7
        result += "  #{ver}"
      when 2,3
        result += " #{hor}#{ver}"
      when 4,8,9
        result += "#{ver}#{hor}#{ver}"
      when 5,6
        result += "#{ver}#{hor} "
    end
    result + ' '
  end
  third_string = arr.inject('') do |result, x|
    case x
      when 0,6,8
        result += "#{ver}#{hor}#{ver}"
      when 1,4,7
        result += "  #{ver}"
      when 2
        result += "#{ver}#{hor} "
      when 3,5,9
        result += " #{hor}#{ver}"
    end
    result + ' '
  end
  puts first_string
  puts second_string
  puts third_string
end

begin
  print_number(ARGV[0].to_i)
rescue Exception => e
  puts "Error! #{e.inspect}"
end

