class RPNCalculator
  # TODO: your code goes here!
    def initialize
        @stack = []
    end

    def push(num)
        @stack.push(num)
    end

    def plus
        raise "calculator is empty" if @stack.size < 2
        result = @stack.pop + @stack.pop
        @stack.push(result)
    end

    def minus
        raise "calculator is empty" if @stack.size < 2
        result = @stack.pop - @stack.pop
        result *= -1
        @stack.push(result)
    end

    def times
        raise "calculator is empty" if @stack.size < 2
        result = @stack.pop * @stack.pop
        @stack.push(result)
    end

    def divide
        raise "calculator is empty" if @stack.size < 2
        result = @stack.pop.fdiv(@stack.pop)
        result = result**-1
        @stack.push(result)
    end

    def value
        @stack.last
    end
    
    def tokens(string)
        tokens = string.split
        tokens.map {|char| operation?(char) ? char.to_sym : Integer(char)}
    end

    def evaluate(string)
        tokens = tokens(string)
        tokens.each do |token|
            case token
            when Integer
                push(token)
            when :+
                plus 
            when :-
                minus
            when :*
                times
            when :/
                divide
            end
        end
        value
    end

    private
    
    def operation?(char)
        "+-*/" .include?(char)
    end
end
