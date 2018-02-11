require_relative 'dsl/pipeline'
require_relative 'dsl/pipeline/transforms'

module Reporting
  module Pipeline
    include DSL::Pipeline
    include DSL::Pipeline::Transforms
    
    extend self
  end
end
