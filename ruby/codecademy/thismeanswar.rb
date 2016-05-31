print "string?"
user_input = gets.chomp
user_input.downcase!
if user_input.include? "s"
    user_input.gsub!(/s/,"th")
else
    print user_input
end
puts user_input