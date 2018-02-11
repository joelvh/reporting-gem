require_relative 'hash_keys'
require_relative 'hash_values'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module Hashes
          include HashKeys
          include HashValues
        end
      end
    end
  end
end
