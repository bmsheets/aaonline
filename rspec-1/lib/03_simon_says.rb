def echo(str)
    str
end

def shout(str)
    str.upcase
end

def repeat(str, repeats = 2)
    result = str
    (repeats - 1).times do |i|
        result += " " + str
    end
    result
end

def start_of_word(str, num_chars = 1)
    str[(0...num_chars)]
end

def first_word(str, num_words = 1)
    str.split[(0...num_words)].join
end

def titleize(str)
    str.split.map.with_index do |word, idx|
        if word.length > 4 || idx == 0
            word.capitalize
        else
            word
        end
    end.join(" ")
end
