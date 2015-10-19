module ActiveAdminJcrop
  module ViewHelpers

    def jcropper_url(object)
      partial_url = []
      partial_url << ActiveAdmin.application.default_namespace
      partial_url << object.class.to_s.demodulize.underscore

      send("jcropper_#{partial_url.reject(&:blank?).join('_')}_path", object)
    end

  end
end
