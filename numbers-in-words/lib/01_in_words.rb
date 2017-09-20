class Fixnum
    def in_words
        string = ""
        if self < 100
            string = read_under_one_hundred(self)
        elsif self < 1000
            string = read_under_one_thousand(self)
        elsif self < 1000000
            string = read_under_one_million(self)
        elsif self < 1000000000
            string = read_under_one_billion(self)
        elsif self < 1000000000000
            string = read_under_one_trillion(self)
        elsif self < 1000000000000000
            string = read_under_one_quadrillion(self)
        end
        clean_string(string)
    end

    private
    def read_digit(num)
        digits = ["zero", "one", "two", "three", "four", "five", 
        "six", "seven", "eight", "nine"]
        digits[num % 10]
    end
        
    def read_teens(num)
        teens  = ["ten", "eleven", "twelve", "thirteen", "fourteen", 
        "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
        teens[num % 10]
    end
    
    def read_tens(num)
        tens = ["ten", "twenty", "thirty", "forty", "fifty",
        "sixty", "seventy", "eighty", "ninety"]
        tens[((num % 100) / 10) - 1]
    end

    def read_under_one_hundred(num)
        string = ""
        if num < 10
            string = read_digit(num)
        elsif num < 20
            string = read_teens(num)
        else
            string = read_tens(num)
            string += " " + read_digit(num) if num % 10 != 0
        end
        string
    end

    def read_under_one_thousand(num)
        hundreds = num / 100
        remainder = num % 100
        string = ""
        string += read_digit(hundreds) + " hundred" if hundreds != 0
        string += " " + read_under_one_hundred(remainder) if remainder != 0
        string
    end

    def read_under_one_million(num)
        thousands = num / 1000
        remainder = num % 1000
        string = ""
        string += read_under_one_thousand(thousands) + " thousand" if thousands != 0
        string += " " + read_under_one_thousand(remainder) if remainder != 0
        string
    end

    def read_under_one_billion(num)
        millions = num / 1000000
        remainder = num % 1000000
        string = ""
        string += read_under_one_thousand(num / 1000000) + " million" if millions != 0
        string += " " + read_under_one_million(num % 1000000) if remainder != 0
        string
    end

    def read_under_one_trillion(num)
        billions = num / 1000000000
        remainder = num % 1000000000
        string = ""
        string += read_under_one_thousand(num / 1000000000) + " billion" if billions != 0
        string += " " + read_under_one_billion(num % 1000000000) if remainder != 0
        string
    end

    def read_under_one_quadrillion(num)
        trillions = num / 1000000000000
        remainder = num % 1000000000000
        string = ""
        string += read_under_one_thousand(num / 1000000000000) + " trillion" if trillions != 0
        string += " " + read_under_one_trillion(num % 1000000000000) if remainder != 0
        string
    end
    
    def clean_string(string)
        string.split.join(" ")
    end
end
