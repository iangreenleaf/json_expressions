require 'json'

module JsonExpressions
  module RSpec
    module Matchers
      class IncludeJsonExpression < MatchJsonExpression
        def initialize(expected)
          super expected.forgiving!
        end

        def failure_message_for_should
          "expected #{@target.inspect} to include JSON expression #{@expected.inspect}\n" + @expected.last_error
        end

        def failure_message_for_should_not
          "expected #{@target.inspect} not to include JSON expression #{@expected.inspect}"
        end
      end

      def include_json_expression(expected)
        IncludeJsonExpression.new(expected)
      end
    end
  end
end
