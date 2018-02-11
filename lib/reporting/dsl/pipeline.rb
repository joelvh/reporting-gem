require_relative 'pipeline/setup'
require_relative 'pipeline/source'
require_relative 'pipeline/transform'
require_relative 'pipeline/destination'
require_relative 'pipeline/finalize'

module Reporting
  module DSL
    module Pipeline
      include Setup
      include Source
      include Transform
      include Destination
      include Finalize
    end
  end
end
