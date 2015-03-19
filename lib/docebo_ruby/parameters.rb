module DoceboRuby
  class Parameters
    def initialize(hash)
      @hash = hash
    end

    def to_s
      @hash.values.join(',')
    end
  end
end
