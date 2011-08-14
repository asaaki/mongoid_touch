# encoding: utf-8

require "mongoid/errors/missing_field"

module Mongoid
  module Document
    def touch( at_field = nil )
      to_touch = at_field || :updated_at
      if self.fields.include? to_touch.to_s
        self.update_attribute(to_touch.to_sym, Time.now.utc)
      else
        raise Errors::MissingField.new(to_touch.to_s)
      end
    end
    alias :touch! :touch
  end
end

