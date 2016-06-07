# Colors class define each methos and include Enumerable module
# it can get access to all of its member

def iterate_colors(colors)
  # Your code here
    arr = []
    colors.each do |item|
        arr.push(item)
    end
    return arr        
end
