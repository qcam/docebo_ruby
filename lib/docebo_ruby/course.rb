module DoceboRuby
  class Course < Resource
    self.api = 'course'

    class << self
      def all
        courses = fetch_data('listCourses') do |data|
          data.delete_if { |key, value| key == 'success' }
        end
        courses.map { |key, value| Course.new value['course_info']  }
      end
    end
  end
end
