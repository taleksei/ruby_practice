# Returns non-repeat numbers
# Example call random_queue.rb
module RandomQueue

  def self.get_next(array, history)
    #history.shift if history.size >= n история ввиде очереди.
    # Минус в том, что после наполнения истории порядок становится не случайный

    history.clear if history.size >= array.size

    current_item = (array - history).sample
    history << current_item
    puts "Current item: #{current_item}"
  end

  def self.get_queue(size)
    array=(1..size).to_a
    history = []

    (size + 5).times do
      get_next(array, history)
      puts  "History: #{history}"
    end
  end
end

RandomQueue.get_queue(10)