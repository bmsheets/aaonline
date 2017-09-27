class Book
    
    LOW_WORDS = ["a", "an", "and", "the", "in", "of"]
    attr_reader :title

    def title=(title)
        words = title.downcase.split
        result = words.map.with_index do |word, i|
            if LOW_WORDS.include?(word) && i != 0 
                word
            else
                word.capitalize
            end
        end.join(" ")
        @title = result
    end
end
