# encoding: utf-8

module Mongoid
  module Errors
    class MissingField < MongoidError
      def initialize(name, instance)
        super(
          translate("touch.missing_field", { :name => name.to_s, :instance => instance.to_s })
        )
      end
    end
  end
end

