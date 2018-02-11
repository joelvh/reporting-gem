module Reporting
  class Matcher
    def initialize(matchers)
      @matchers = matchers
    end

    def match?(value)
      @matchers.any? do |matcher|
        case matcher
        when Regexp
          matcher =~ value
        else
          matcher == value
        end
      end
    end
  end
end
