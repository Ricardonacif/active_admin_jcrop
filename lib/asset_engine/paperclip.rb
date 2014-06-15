module ActiveAdminJcrop
  module AssetEngine
    class <<self
      def thumbnail_names(obj, field)
        obj.send(field).styles.keys
      end

      def crop!(obj, field)
        obj.send(field).reprocess!
      end
    end
  end
end

module Paperclip

  module NewClassMethods
    def has_attached_file(*args)
      super

      self.attachment_definitions.each do |name, options|
        options[:processors] ||= []
        options[:processors] << :active_admin_jcropper
      end
    end
  end

  module ClassMethods
    def self.extended(base)
      super
      base.send :extend, ::Paperclip::NewClassMethods
    end
  end

  class ActiveAdminJcropper < Thumbnail
    def transformation_command
      if @attachment.instance.active_admin_cropping?
        ary = super
        if i = ary.index('-crop')
          ary.delete_at i+1
          ary.delete_at i
        end
        ['-crop', crop_params] + ary
      else
        super
      end
    end

    def crop_params
      target = @attachment.instance
      "'#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}'"
    end
  end

end

module ActiveAdmin
  module Config
    module Fields
      module Types
        module UploaderMethods

          def self.included(base)
            base.register_instance_option(:cache_method) do
              nil
            end

            base.register_instance_option(:thumb_method) do
              @thumb_method ||= ((styles = bindings[:object].send(name).styles.keys).find{|k| k.in?([:thumb, :thumbnail, 'thumb', 'thumbnail'])} || styles.first.to_s)
            end

            base.register_instance_option(:delete_method) do
              nil
            end
          end

          def resource_url(thumb = false)
            return nil unless (attachment = bindings[:object].send(name)).present?
            thumb.present? ? attachment.url(thumb) : attachment.url
          end

        end
      end
    end
  end
end
