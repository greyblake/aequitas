require_relative '../../../spec_helper'
require_relative '../../shared/rule/integration_spec'
require 'aequitas'

module Aequitas
  class Rule
    IntegrationSpec.describe Confirmation do
      before do
        class_under_test.send(:attr_accessor, "#{attribute_name}_confirmation")
        class_under_test.validates_confirmation_of attribute_name
        subject.send("#{attribute_name}_confirmation=", confirmation_value)
      end

      describe 'when confirmation value matches' do
        let(:attribute_value)    { :foo }
        let(:confirmation_value) { :foo }

        it_should_be_a_valid_instance
      end

      describe 'when confirmation value does not match' do
        let(:attribute_value) { :foo }
        let(:confirmation_value) { :bar }

        it_should_be_an_invalid_instance
      end
    end
  end # class Rule
end # module Aequitas
