module Docebo
  class Course < Resource
    self.api = 'course'

    class << self
      def all
        courses = fetch_data('listCourses') do |data|
          data.delete_if { |key, value| key == 'success' }
        end
        courses.map { |key, value| Course.new value['course_info']  }
      end

      def add_user_subscription(course_id, user_id)
        fetch_data('addUserSubscription', {course_id: course_id, id_user: user_id}) do |data|
          data['success']
        end
      end
    end
  end
end
