require_relative '../../../transforms/explode_enumerable'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module Enumerables
          # Specify multiple methods to call
          # (e.g. :downcase, :to_sym, etc)
          def map(*methods, **options, &block)
            transform **options do |row, context|
              row = methods.reduce(row, :send)
              row = yield(row) if block_given?
              row
            end
          end

          def flatten(**options, &block)
            map :flatten, **options, &block
          end

          def explode(**options, &block)
            transform **options do |rows, context|
              next rows unless rows.is_a?(Array)
              
              rows.each { |row| yield row }

              nil # don't return anything that might be treated as a row
            end
          end
        end
      end
    end
  end
end
