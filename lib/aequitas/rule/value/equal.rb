# -*- encoding: utf-8 -*-

require 'aequitas/rule/value'

module Aequitas
  class Rule
    class Value
      class Equal < Value

        def valid_value?(value)
          value == expected
        rescue ArgumentError
          # TODO: figure out better solution for: can't compare String with Integer
          true
        end

        def violation_type(resource)
          :equal_to
        end

        def violation_data(resource)
          [ [ :expected, expected ] ]
        end

      end # class Equal
    end # class Value
  end # class Rule
end # module Aequitas