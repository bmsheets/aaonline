def measure(num_calls = 1, &prc)
    start = Time.now
    num_calls.times { prc.call }
    (Time.now - start) / num_calls
end
