def add(a,b)
  c = (a.count + 1).times.map{|i| 0}
  carry = 0
  (a.count-1).downto(0).each do |i|
    sum = a[i] + b[i] + carry
    if sum == 3
      c[i+1] = 1
      carry = 1
    elsif sum == 2
      c[i+1] = 0
      carry = 1
    else
      c[i+1] = sum
      carry = 0
    end
  end
  c[0] = carry
  c
end

a = [1,0,0,0,1,1]
b = [1,1,0,0,1,0]
puts " #{a.join("")}"
puts "+#{b.join("")}"
puts "-------------------"
puts add(a,b).join("")
