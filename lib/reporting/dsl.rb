module Reporting
  module DSL
    def self.dsl(*modules)
      modules.each do |mod|
        include mod
        extend mod
      end
    end
  end
end
