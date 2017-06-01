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
      button 'Insertion', width: 1.0, height: 0.5 do
        insertion_sort
      end
      button 'Reset', width: 1.0, height: 0.5 do
        @array = (1..100).to_a.shuffle
        update_chart
      end
    end
  end

  update_chart
end
