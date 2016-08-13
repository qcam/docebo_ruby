module Docebo
  class Course < Resource
    self.api = 'course'

    class << self
      def all
        fetch_data('courses')
      end

      def add_user_subscription(course_id, user_id)
        fetch_data('addUserSubscription', {course_id: course_id, id_user: user_id})
      end
    end
  end
end
