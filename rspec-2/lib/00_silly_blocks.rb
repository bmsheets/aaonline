def reverser(&prc)
    str = prc.call
    str.split.map {|word| word.reverse}.join(" ")
end

def adder(increment = 1, &prc)
    prc.call + increment
end

def repeater(repeats = 1, &prc)
    repeats.times do
        prc.call
    end
end
