def bubble_sort(arr)
  (0...arr.count).each do |i|
    (arr.count-1).downto(i+1).each do |j|
      if arr[j] < arr[j-1]
        temp = arr[j-1]
        arr[j-1] = arr[j]
        arr[j] = temp
      end
    end
  end
  arr
end

array = (1..50).to_a.shuffle
puts "Unsorted: #{array.to_s}"
puts "Sorted: #{bubble_sort(array).to_s}"
