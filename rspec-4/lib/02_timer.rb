class Timer
   
    attr_accessor :seconds
 
    def initialize(seconds = 0)
        @seconds = seconds
    end

    def time_string
        "#{pad(hours)}:#{pad(minutes)}:#{pad(num_seconds)}"
    end

    def hours
        seconds / 3600
    end
    
    def minutes
        (seconds % 3600) / 60
    end

    def num_seconds
        seconds % 60
    end

    def pad(num)
        if num > 10
            "#{num}"
        else
            "0#{num}"
        end
    end
end
