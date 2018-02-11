require_relative 'transforms/hashes'
require_relative 'transforms/enumerables'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        include Hashes
        include Enumerables
      end
    end
  end
end
