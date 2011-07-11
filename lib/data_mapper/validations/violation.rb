require 'forwardable'

module DataMapper
  module Validations

    class Violation
      extend Forwardable
      extend Equalizer

      EQUALIZE_ON = [:validator, :custom_message, :block]

      equalize *EQUALIZE_ON

      def_delegators :validator, :attribute_name, :violation_type, :message_data

      attr_reader :resource
      attr_reader :validator
      attr_reader :custom_message
      attr_reader :message_data

      attr_accessor :transformer

      def initialize(validator, message_or_data = nil, transformer = nil, &block)
        @validator   = validator
        @transformer = transformer

        case message_or_data
        when String
          @custom_message = message_or_data
        when Symbol
          @violation_type = message_or_data
        when Array
          @message_data = message_or_data
        else
          @resource = message_or_data
        end

        unless validator || message || block
          raise ArgumentError, "expected one of +validator+, +message+ or +block+"
        end
      end

      def message(transformer = Undefined)
        if Undefined != transformer
          transformer.transform(self)
        elsif custom_message
          custom_message
        elsif block
          block.arity.zero? ? block.call : block.call(self)
        else
          self.transformer.transform(self)
        end
      end

      def to_s
        message
      end

      def inspect
        out = "#<#{self.class.name}"
        self.class::EQUALIZE_ON.each do |ivar|
          value = send(ivar)
          out << " @#{ivar}=#{value.inspect}"
        end
        out << ">"
      end

    end # class Violation

  end # module Validations
end # module DataMapper
