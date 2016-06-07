def skip_animals(animals, skip)
    arr = []
    animals.each_with_index do |animal, index|        
        if index >= skip            
            arr.push "#{index}:#{animal}"
        end
    end
    return arr
end
