def get_max_crossing_subarray(arr, low, mid, high)
  left_sum = -999 # lower bound of possible values in "arr"
  sum = 0
  max_left = 0

  mid.downto(low).each do |i|
    sum += arr[i]
    if sum > left_sum
      left_sum = sum
      max_left = i
    end
  end

  right_sum = -999
  sum = 0
  max_right = 0

  ((mid+1)..high).each do |j|
    sum += arr[j]
    if sum > right_sum
      right_sum = sum
      max_right = j
    end
  end

  return [max_left, max_right, left_sum + right_sum]
end

def get_max_subarray(arr, low, high)
  return [low, high, arr[low]] if high == low

  mid = ((low + high)/2).floor
  left_low, left_high, left_sum = get_max_subarray(arr, low, mid)
  right_low, right_high, right_sum = get_max_subarray(arr, mid+1, high)
  cross_low, cross_high, cross_sum = get_max_crossing_subarray(arr, low, mid, high)

  max = [left_sum, right_sum, cross_sum].max
  
  return case max
         when left_sum
          [left_low, left_high, left_sum]
         when right_sum
          [right_low, right_high, right_sum]
         when cross_sum
          [cross_low, cross_high, cross_sum]
         end
end


a = [13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7].shuffle
puts "For arr: [#{a.join(",")}]"
max_sub =  get_max_subarray(a, 0, a.count-1)
puts "The maximum subarray starts at #{max_sub[0]}(#{a[max_sub[0]]}) and ends a #{max_sub[1]}(#{a[max_sub[1]]})"
puts "For a max sum of: #{max_sub[2]}!"

