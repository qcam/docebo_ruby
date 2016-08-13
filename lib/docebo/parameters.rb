module Docebo
  class Parameters
    def initialize(hash)
      @hash = hash.to_h
    end

    def to_s
      @hash.values.map do |v|
        case v
        when Hash then Docebo::Parameters.new(v).to_s
        else v
        end
      end.join(',')
    end
  end
end
