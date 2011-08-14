# encoding: utf-8

module Mongoid
  module Errors
    class MissingField < MongoidError
      def initialize(name)
        super(
          translate("missing_field", { :name => name })
        )
      end
    end
  end
end

