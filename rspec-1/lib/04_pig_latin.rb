def translate(str)
    str.split.map do |word|
       translate_word(word) 
    end.join(" ")
end

def translate_word(word)
    if word.include?("qu")
        idx = word.index("qu")
        result = word[(2 + idx..-1)] + word[(0...idx)] + "quay"
    else
        lc = num_leading_consonants(word)
        result = word[(lc..-1)] + word[(0...lc)] + "ay"
    end
    result
end

def num_leading_consonants(word)
    leading_consonants = 0
    word.chars.each do |char|
        if is_vowel?(char)
            break
        else
            leading_consonants += 1
        end
    end 
    leading_consonants
end

def is_vowel?(letter)
    vowels = "aeiou"
    vowels.include?(letter.downcase)
end
