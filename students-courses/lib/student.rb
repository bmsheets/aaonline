class Student
    attr_reader :first_name, :last_name, :courses

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @courses = []
    end

    def name
        "#{first_name} #{last_name}"
    end

    def enroll(course)
        return if courses.include?(course)
        raise "Course conflict" if has_conflict?(course)
        courses.push(course)
        course.students.push(self)
    end

    def has_conflict?(new_course)
        courses.any? do |course|
            course.conflicts_with?(new_course)
        end
    end

    def course_load
        load = Hash.new(0)
        courses.each do |course|
            load[course.department] += course.credits
        end
        load
    end

end
