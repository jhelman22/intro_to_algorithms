def square_matrix_multiply(a, b)
  n = a.count
  c = n.times.map{|i| n.times.map{|j| 0}}

  (0...n).each do |i|
    (0...n).each do |j|
      c[i][j] = 0
      (0...n).each do |k|
        c[i][j] += a[i][k] * b[k][j]
      end
    end
  end

  c
end


a = [[12,8,3],[1,5,4],[-4,2,-8]]
b = [[4,0,8],[3,1,6],[2,-9,5]]
c = square_matrix_multiply(a,b)
c.count.times do |row|
  puts c[row].join(",")
end
