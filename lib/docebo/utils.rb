require 'digest/sha1'
require 'base64'

module Docebo
  module Utils
    extend self

    CODE_FORMAT = '%{key}:%{codice}'.freeze
    CODICE_FORMAT = '%{params},%{secret}'.freeze

    def code(key, secret, params)
      Kernel.format(
        "Docebo %s",
        Base64.strict_encode64(
          Kernel.format(CODE_FORMAT, key: key, codice: codice(secret, params))
        )
      )
    end

    def codice(secret, params)
      Digest::SHA1.hexdigest(
        Kernel.format(CODICE_FORMAT, params: collect_values(params), secret: secret)
      )
    end

    def collect_values(hash)
      hash.values.map do |v|
        case v
        when Hash then collect_values(v)
        else v
        end
      end.join(',')
    end
  end
end
