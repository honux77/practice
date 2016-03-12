#!/usr/bin/ruby
def scoring(array)
    array.each do |user|
    # update_score of every user in the array unless the user is admin
        unless user.is_admin?
            user.update_score
        end
    end 
end

class User
	@@num_users=0
	def initialize(name, score)
		@name = name
		@score = score
		@@num_users += 1
		@is_admin = false
	end

	def set_admin
		@is_admin = true	
	end
	def is_admin?
		@is_admin
	end
	def update_score()
		@score += 1
		puts("Score Updated")
	end
	def self.num_users
		@@num_users
	end

	def to_s
		if @is_admin
			"#{@name}: is admin"
		else
			"#{@name}: #{@score}"
		end
	end
end

# main
users = Array.new

for i in 0..4
	user = User.new("user#{i}", 80+i)
	users.push(user)
	if i == 3 
		user.set_admin
	end
end

scoring(users)

puts(User.num_users)

users.each do |user|
	puts(user)
end
