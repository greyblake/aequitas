require 'dm-core'

require 'data_mapper/validations/support/ordered_hash'
require 'data_mapper/validations/support/object'

require 'data_mapper/validations'

require 'data_mapper/validations/context'
require 'data_mapper/validations/violation'
require 'data_mapper/validations/error_set'

require 'data_mapper/validations/rule'
require 'data_mapper/validations/rule_set'
require 'data_mapper/validations/contextual_rule_set'

require 'data_mapper/validations/resource'
require 'data_mapper/validations/model_extensions'
require 'data_mapper/validations/inferred'

# TODO: eventually drop this from here and let it be an opt-in require
require 'data_mapper/validations/backward'
# TODO: consider moving to a version-specific backwards-compatibility file:
# require 'data_mapper/validations/backward/1_1'

module DataMapper
  module Validations

    class InvalidContextError < StandardError; end

  end
end
