module Docebo
  class Orgchart < Resource
    self.api = 'orgchart'
    class << self
      def create_node(attributes = {})
        fetch_data('createNode', attributes)
      end
    end
  end
end
