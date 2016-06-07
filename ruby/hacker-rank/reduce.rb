def sum_terms(n)
    (1..n).map {|x| x * x + 1}.reduce(0, :+)
end
