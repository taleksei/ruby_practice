# Counts how many times the number in arrays.
# Example call: number_counter.rb [[4, 19], nil, [32, 41], 65], [65, 0, 19, [54,54,54]]
# Result: {4=>1, 19=>2, 32=>1, 41=>1, 65=>2, 0=>1, 54=>3}
module NumberCounter

  def self.calculate(arrays)

    array = []
    arrays.each { |item| array << item.scan(/\d+/).map(&:to_i) }

    array = array.flatten.reduce(Hash.new{ 0 }) do |result, i|
      result[i] += 1
      result
    end

    p "Result: #{array}"
  rescue => exception
    p "Error! #{exception.inspect}"
  end
end

NumberCounter.calculate(ARGV)