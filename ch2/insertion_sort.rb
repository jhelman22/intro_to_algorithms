def insertion_sort(arr)
  (1...arr.length).each do |j|
    key = arr[j]
    i = j - 1
    while i >= 0 && arr[i] > key
      arr[i+1] = arr[i]
      i -= 1
    end
    arr[i+1] = key
  end
  arr
end

array = (1..50).to_a.shuffle
puts "Unsorted: #{array.to_s}"
puts "Sorted: #{insertion_sort(array).to_s}"
