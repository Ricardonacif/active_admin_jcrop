module Formtastic
  module Inputs
    class JcropableInput < ::Formtastic::Inputs::FileInput
      include Base

      VALID_OPTIONS = %i(
        aspectRatio
        minSize
        maxSize
        setSelect
        bgColor
        bgOpacity
        boxWidth
        boxHeight
      )

      def to_html
        input_wrapping do
          label_html <<
          builder.file_field(method, input_html_options) <<
          jcrop_feature
        end
      end

      private

      def jcrop_feature
        if @object.send(method).present?
          template.render(partial: "active_admin_jcrop/jcrop_modal", locals: {field: method, object: @object, jcrop_options: jcrop_options})
        else
          ''
        end
      end

      def jcrop_options
        options[:jcrop_options] ||= {}
        options[:jcrop_options].assert_valid_keys(*VALID_OPTIONS)
        options[:jcrop_options].reverse_merge!(setSelect: [0,0,100,100])
      end

    end
  end
end
