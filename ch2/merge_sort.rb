def merge(left, right)
  merged = []
  while left.count > 0 && right.count > 0
    if left[0] <= right[0]
      merged.push(left.slice!(0))
    else
      merged.push(right.slice!(0))
    end
  end
  merged.push(left) if left.count > 0
  merged.push(right) if right.count > 0
  merged.flatten
end

def recursive_merge_sort(arr)
  return arr unless arr.count > 1
  q = (arr.count / 2).floor
  left = recursive_merge_sort(arr[0...q])
  right = recursive_merge_sort(arr[q...arr.count])
  merge(left,right)
end

def bottom_up_merge_sort(arr)
  # array of single element arrays to represent bottom of merge sort tree
  level = arr.map{|a| [a]}
  next_level = []
  while level.count > 1
    if level.count.even?
      (1...level.count).step(2).each do |i|
        next_level.push(merge(level[i-1],level[i]))
      end
    else
      (1...level.count-1).step(2).each do |i|
        next_level.push(merge(level[i-1],level[i]))
      end
      element = next_level.slice!(-1)
      next_level.push(merge(element,level[-1]))
    end
    level = next_level
    next_level = []
  end
  level.flatten
end

array = (1..50).to_a.shuffle
puts "Unsorted: #{array.to_s}"
puts "---- Recursive Merge Sort ---------"
puts recursive_merge_sort(array).to_s
puts "---- Bottom Up Merge Sort ---------"
puts bottom_up_merge_sort(array).to_s
