def add(a, b)
    a + b
end

def subtract(a, b)
    a - b
end

def sum(arr)
    return 0 if arr.empty?
    arr.reduce(:+)
end
