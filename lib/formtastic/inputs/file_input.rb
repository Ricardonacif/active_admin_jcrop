module Formtastic
  module Inputs
    class FileInput
      include Base
      
      def to_html
        input_wrapping do
          label_html <<
          builder.file_field(method, input_html_options) <<
          jcrop_feature
        end
      end

      private

      def jcrop_feature
        jcrop_option? ? jcrop_partial : ""
      end

      def jcrop_option?
        options[:jcrop] && @object.send(method).present?
      end

      def jcrop_partial

        template.render partial: "active_admin_jcrop/jcrop_modal" 
      end

    end
  end
end