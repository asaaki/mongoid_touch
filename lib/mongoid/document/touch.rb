# encoding: utf-8

module Mongoid
  module Document
    module Touch
      extend ActiveSupport::Concern
      
      included do
      end 
        def touch( at_field = nil )
          unless self.frozen?
            to_touch = at_field || :updated_at
            if self.fields.include? to_touch.to_s
              return true if self.update_attribute(to_touch.to_sym, Time.now.utc)
              false
            else
              return false
            end
          else
            false
          end
        end
        
        def touch!( at_field = nil, force_fail = false )
          raise Errors::DocumentNotUpdated.new(self) if force_fail
          unless self.frozen?
            to_touch = at_field || :updated_at
            if self.fields.include? to_touch.to_s              
              return true if self.update_attribute(to_touch.to_sym, Time.now.utc)
              raise Errors::DocumentNotUpdated, self
            else
              raise Errors::MissingField.new(to_touch, self)
            end
          else
            raise Errors::FrozenInstance, self
          end
        end
    end
  end
end

