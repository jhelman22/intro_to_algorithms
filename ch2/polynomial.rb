# evaluating polynomials that are represented as an array where
# the index represents the power of x and the value represents the constant to
# multiply the power of x by
# example:
# y = 3x^3 + 2x^2 + 4
# [4,0,2,3]
# where the array represents
# (4 * x^0) + (0 * x^1) + (2 * x^2) + (3 * x^3)
#

def naive(polynomial,x)
  polynomial.each_with_index.inject(0){|y,(c,pow)| y + (c * (x ** pow)) }
end

# Horner's Rule
def horners(polynomial, x)
  y = 0
  (polynomial.count-1).downto(0).each do |i|
    y = polynomial[i] + x * y
  end
  y
end

poly = [4,0,2,5] # y = 5x^3 + 2x^2 + 4
puts "When x is 3, y is #{naive(poly,3)}"
puts "When x is 1, y is #{naive(poly,1)}"

puts "With Horners rule..."
puts "When x is 3, y is #{horners(poly,3)}"
puts "When x is 1, y is #{horners(poly,1)}"
