# require 'insertion.rb'

def generate_random_array
  (0..100).to_a.shuffle
end

Shoes.app(width: 400, height: 400) do
  background "#DFA"
  para "Sort Visualizer"

  @array = generate_random_array

  # draw graph
  stack(top: 50, left: 50, width: 300, height: 100) do
    border black, strokewidth: 2
    fill red
    @array.each_with_index do |element,i|
      rect(left: 3*i,
        bottom: 100,
        top: 100 - element,
        width: 2)
    end
  end


end
