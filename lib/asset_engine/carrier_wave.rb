module ActiveAdminJcrop
  module AssetEngine
    class <<self
      def thumbnail_names(obj, field)
        obj.class.uploaders[field.to_sym].versions.keys
      end

      def crop!(obj, field)
        obj.send(field).recreate_versions!
      end
    end

    module CarrierWave
      def active_admin_crop
        return unless model.active_admin_cropping?
        manipulate! do |img|
          ::ActiveAdminJcrop::ImageHelper.crop(img, model.crop_w, model.crop_h, model.crop_x, model.crop_y)
          img
        end
      end
    end
  end
end

module CarrierWave
  module Mount
    module Extension
      def self.included(base)
        base.uploaders.each do |name, klass|
          klass.send :include, ActiveAdminJcrop::AssetEngine::CarrierWave
        end
      end
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
              "#{name}_cache"
            end

            base.register_instance_option(:thumb_method) do
              @thumb_method ||= ((versions = bindings[:object].send(name).versions.keys).find{|k| k.in?([:thumb, :thumbnail, 'thumb', 'thumbnail'])} || versions.first.to_s)
            end

            base.register_instance_option(:delete_method) do
              "remove_#{name}"
            end
          end

          def resource_url(thumb = false)
            return nil unless (uploader = bindings[:object].send(name)).present?
            thumb.present? ? uploader.send(thumb).url : uploader.url
          end

        end
      end
    end
  end
end
