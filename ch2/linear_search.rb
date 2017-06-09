def linear_search(arr,v)
  index = nil
  arr.each_with_index do |element, i|
    if element == v
      index = i
      break
    end
  end
  index
end

array = (1..50).to_a.shuffle
puts "Array: #{array.to_s}"
puts "Index of 4: #{linear_search(array,4)}"
puts "Index of 10: #{linear_search(array,10)}"
puts "Index of 51: #{linear_search(array,51)}"
