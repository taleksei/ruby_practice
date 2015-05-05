# Выводит неповторяющиеся числа

@n=10
@array=(1..@n).to_a

@history = Array.new

def get_num
  #@history.shift if @history.size >= @n история ввиде очереди.
  # Минус в том, что после наполнения истории порядок становится не случайный

  @history.clear if @history.size >= @n

  current_item = (@array - @history).sample
  @history << current_item
  puts "Current item: #{current_item}"
end

(@n+5).times do
  get_num
  puts  "history: #{@history.to_s}"
end

