module Reporting
  module Pipeline
    class Transform < Step
      dsl DSL::Pipeline::Transform
      dsl DSL::Pipeline::Transforms
    end
  end
end
