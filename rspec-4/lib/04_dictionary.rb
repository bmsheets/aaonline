class Dictionary
    attr_reader :entries

    def initialize
        @entries = {}
    end

    def add(entries)
        if entries.is_a?(String)
            @entries[entries] = nil
        elsif entries.is_a?(Hash)
            @entries.merge!(entries)
        end
    end

    def include?(word)
        @entries.include?(word)
    end

    def find(fragment)
        @entries.select do |word, definition|
            word.match(fragment)
        end
    end

    def keywords
        @entries.keys.sort
    end

    def printable
        keywords.map do |key|
            %Q{[#{key}] "#{entries[key]}"}
        end.join("\n")
    end
end
