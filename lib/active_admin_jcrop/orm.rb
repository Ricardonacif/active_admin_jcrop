module ActiveAdminJcrop
  module Orm
    module Extension

      CropFields = [:crop_x, :crop_y, :crop_w, :crop_h, :crop_field]

      def self.included(base)
        base.send :attr_accessor, *CropFields
      end

      def active_admin_cropping?
        CropFields.all? {|f| send(f).present?}
      end

      def active_admin_crop!(params)
        
        CropFields.each {|f| self.send "#{f}=", params[f] }

        ::ActiveAdminJcrop::AssetEngine.crop!(self, self.crop_field) if self.active_admin_cropping?
      end

    end
  end
end

if defined?(::ActiveRecord)
  ::ActiveRecord::Base.send(:include, ::ActiveAdminJcrop::Orm::Extension)
end

if defined?(::Mongoid)
  module Mongoid
    module Document
      def self.included(base)
        base.send(:include, ::ActiveAdminJcrop::Orm::Extension)
      end
    end
  end
end
