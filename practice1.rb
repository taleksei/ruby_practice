# Подсчитывает сколько раз встречается число в массивах.
# пример вызова: [[4, 19], nil, [32, 41], 65], [65, 0, 19, [54,54,54]]
# ожидаемый результат Result: {4=>1, 19=>2, 32=>1, 41=>1, 65=>2, 0=>1, 54=>3}
begin
  c = Array.new
  ARGV.each do |item|
    c << item.scan( /\d+/ ).map(&:to_i)
  end

  c = c.flatten.inject(Hash.new{ 0 }) do |result, i|
    result[i] += 1
    result
  end

  puts "Result: #{c.to_s}"
rescue Exception => e
  puts "Error! #{e.inspect}"
end


