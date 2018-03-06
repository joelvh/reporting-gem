require_relative 'dsl'
require_relative 'dsl/pipeline'
require_relative 'dsl/pipeline/transforms'

module Reporting
  module Pipeline
    include DSL
    
    dsl DSL::Pipeline
    dsl DSL::Pipeline::Transforms
  end
end
