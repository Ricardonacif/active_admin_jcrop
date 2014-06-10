class ActiveAdminJcropRailtie < Rails::Railtie
  initializer "active_admin_jcrop_railtie.configure_rails_initialization" do
    ActiveAdmin.setup do |config|
      config.register_javascript 'active_admin_jcrop/crop_modal'
      config.register_stylesheet "active_admin_jcrop/crop_modal"
    end
  end
end