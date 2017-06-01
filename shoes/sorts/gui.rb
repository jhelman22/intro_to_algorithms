# require 'insertion.rb'

def generate_random_array
  (1..100).to_a.shuffle
end

def sort_array(arr)
  arr.sort
end

Shoes.app(width: 400, height: 500) do
  def update_chart()
    @chart.clear
    @chart.append do
      border black, strokewidth: 2
      fill red
      @array.each_with_index do |element,i|
        rect(left: 4*i,
          bottom: 400,
          top: (100 - element) * 4,
          width: 4)
      end
    end
  end

  flow width: 400, height: 500 do
    background "#DFA"
    # Title bar
    flow width: 1.0, height: 0.1 do
      caption "Sort Visualizer"
    end
    @array = generate_random_array
    # Chart window
    @chart = flow width: 1.0, height: 0.8 do
      border black, strokewidth: 2
      fill red
      @array.each_with_index do |element,i|
        rect(left: 4*i,
          bottom: 400,
          top: (100 - element) * 4,
          width: 4)
      end
    end
    # Sort button panel
    flow width: 1.0, height: 0.1 do
      button 'Insertion', width: 1.0, height: 1.0 do
        @array = sort_array(@array)
        update_chart
      end
    end
  end
end
