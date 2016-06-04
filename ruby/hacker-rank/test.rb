def identify_class(obj)
	name = obj.class.to_s
	case name
		when 'Hacker','Submission','Testcase','Contest'
			puts "It's a #{name}"
		else
			puts "It's an unknown model"
	end
end
