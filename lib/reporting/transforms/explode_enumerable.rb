require_relative '../transform'
require_relative '../matcher'

module Reporting
  module Transforms
    class ExplodeEnumerable < Transform
      def call(rows)
        rows = Array(rows)
        rows = rows.flatten if @options[:flatten]
        
        rows.each { |row| yield row }

        nil # don't return anything that might be treated as a row
      end
    end
  end
end
