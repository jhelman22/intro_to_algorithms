Shoes.app(width: 400, height: 500) do
  def insertion_sort
    j = 1
    i = j - 1
    key = @array[j]
    every 0.01 do
      break if j == @array.count
      if i >= 0 && @array[i] > key
        @array[i+1] = @array[i]
        i -= 1
        update_chart(j,i)
      else
        @array[i+1] = key
        j += 1
        i = j - 1
        key = @array[j]
        update_chart
      end
    end
  end

  def selection_sort
    i = 0
    min = 0
    j = 1
    every 0.01 do
      break if i == @array.count - 1
      if @array[min] > @array[j]
        min = j
        update_chart(min,j)
      elsif j == @array.count - 1
        min_element = @array[min]
        @array[min] = @array[i]
        @array[i] = min_element
        i += 1
        min = i
        j = i + 1
        update_chart(min,j)
      else
        j += 1
        update_chart(min,j)
      end
    end
  end

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

  def merge_sort
    level = @array.map{|a| [a]}
    next_level = []
    every 1 do
      break if level.count == 1
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
      @array = level.flatten
      update_chart
    end
  end

  def update_chart(j=-1,i=-1)
    @chart.clear
    @chart.append do
      border black, strokewidth: 2
      @array.each_with_index do |element,ix|
        fill green
        fill yellow if ix == j
        fill red if ix == i
        rect(left: 4*ix,
          bottom: 400,
          top: (100 - element) * 4,
          width: 4)
      end
    end
  end

  @array = (1..100).to_a.shuffle

  flow width: 400, height: 500 do
    background "#DFA"
    # Title bar
    flow width: 1.0, height: 0.1 do
      caption "Sort Visualizer"
    end
    # Chart window
    @chart = flow width: 1.0, height: 0.8 do
    end
    # Sort button panel
    flow width: 1.0, height: 0.1 do
      button 'Insertion', width: 0.3, height: 0.5 do
        insertion_sort
      end
      button 'Selection', width: 0.3, height: 0.5 do
        selection_sort
      end
      button 'Merge', width: 0.3, height: 0.5 do
        merge_sort
      end
      button 'Reset', width: 1.0, height: 0.5 do
        @array = (1..100).to_a.shuffle
        update_chart
      end
    end
  end

  update_chart
end
