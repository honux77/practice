def prime? (x)
	return false if x == 1
    (2 .. x / 2).each do |n|
        return false if x % n == 0 
    end
    true
end

puts prime? 11
puts prime? 3 
puts prime? 2 
puts prime? 25
puts prime? 1 
