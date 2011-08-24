# encoding: utf-8

module Mongoid
  module Errors
    class DocumentNotUpdated < MongoidError
      def initialize(name)
        super(
          translate("touch.document_not_updated", { :name => name.to_s })
        )
      end
    end
  end
end

