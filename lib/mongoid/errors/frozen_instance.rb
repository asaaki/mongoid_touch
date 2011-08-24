# encoding: utf-8

module Mongoid
  module Errors
    class FrozenInstance < MongoidError
      def initialize(name)
        super(
          translate("touch.frozen_instance", { :name => name.to_s })
        )
      end
    end
  end
end

