module DoceboRuby
  class User < Resource
    self.api = 'user'

    class << self
      def check_username(username)
        fetch_data('checkUsername', {userid: username})['success']
      end
    end
  end
end
