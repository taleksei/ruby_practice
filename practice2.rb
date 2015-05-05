#Находит точки, которые входят в заданную окружность окружность
# пример вызова: [[1,2],[60,56],[69,56]]# пример вызова:
# ожилаемый результат: Result: [[60.0, 56.0], [69.0, 56.0]]
y = 56.837992
x = 60.597223
r = 10

points = Array.new

begin
  ARGV[0][2..-3].split('],[').each do |item|
    point = item.split(',').map(&:to_f)
    points << point if ( (point[0]-x)**2 + (point[1]-x)**2 ) <= r**2
  end

  puts "Result: #{points.to_s}"
rescue Exception => e
  puts "Error! #{e.inspect}"
end