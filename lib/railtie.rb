class ActiveAdminJcropRailtie < Rails::Railtie
  initializer "active_admin_jcrop_railtie.configure_rails_initialization" do
    ActiveAdmin.setup do |config|
      [ 'active_admin_jcrop/crop_modal',
        "active_admin_jcrop/jquery.color",
        "active_admin_jcrop/jquery.Jcrop.min"
      ].each do |js|
        config.register_javascript js
      end

      [ "active_admin_jcrop/crop_modal",
        'active_admin_jcrop/jquery.Jcrop.min'
      ].each do |css|
        config.register_stylesheet css
      end
      
    end
  end
end