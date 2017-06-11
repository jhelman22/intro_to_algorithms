# finds index of val in sorted array, arr
def binary_search(arr, val, from=0, to=nil)
  to = arr.count - 1 unless to
  return -1 if from < 0 || from >= arr.count || to < 0 || to >= arr.count
  mid = (from + to) / 2

  if val < arr[mid]
    return binary_search(arr,val,from,mid-1)
  elsif val > arr[mid]
    return binary_search(arr,val,mid+1,to)
  else
    return mid
  end
end

array = (1..100).to_a
puts "Search for 3: #{binary_search(array,3)}"
puts "Search for 101: #{binary_search(array,101)}"
