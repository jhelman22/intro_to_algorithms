def selection_sort(arr)
  (0...arr.count).each do |i|
    min = arr[i..-1].min
    min_index = arr.index(min)
    unless i == min_index
      arr[min_index] = arr[i]
      arr[i] = min
    end
  end
  arr
end

array = (1..50).to_a.shuffle
puts "Unsorted: #{array.to_s}"
puts "Sorted: #{selection_sort(array).to_s}"
