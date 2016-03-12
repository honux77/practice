#!/usr/bin/ruby
def scoring(array)
    # iterate through each of the element in array using *each* and call update_score on it
    array.each do |user|
        user.update_score()
    end 
end

class User
	@@num_users=0
	def update_score()
		@score += 1
		puts("Score Updated")
	end
	def initialize(name, score)
		@name = name
		@score = score
		@@num_users += 1
	end
	def self.num_users
		@@num_users
	end

	def to_s
		"#{@name}: #{@score}"
	end
end

# main
users = Array.new

for i in 0..4
	users.push(User.new("user#{i}", 80+i))
end

scoring(users)

puts(User.num_users)

users.each do |user|
	puts(user)
end
