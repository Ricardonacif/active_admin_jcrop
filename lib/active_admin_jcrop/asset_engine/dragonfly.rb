module ActiveAdminJcrop
  module AssetEngine
    class <<self
      def thumbnail_names(obj, field)
        obj.class.uploaders[field.to_sym].versions.keys
      end

      def crop!(obj, field)
        obj.update_attributes! field => obj.file.convert("-crop #{obj.crop_w.to_i}x#{obj.crop_h.to_i}+#{obj.crop_x.to_i}+#{obj.crop_y.to_i}").file
        true
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
              nil
            end

            base.register_instance_option(:thumb_method) do
              @thumb_method ||= :thumb
            end

            base.register_instance_option(:delete_method) do
              nil
            end
          end

          def resource_url(thumb = false)
            return nil unless (attachment = bindings[:object].send(name)).present?
            thumb.present? ? attachment.thumb(thumb).url : attachment.url
          end

        end
      end
    end
  end
end
