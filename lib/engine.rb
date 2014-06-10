module ActiveAdminJcrop
  class Engine < ::Rails::Engine
    
    initializer "ActiveAdmin precompile hook" do |app|
      app.config.assets.precompile += ['active_admin_jcrop/crop_modal.js', 'active_admin_jcrop/crop_modal.css']
    end
  end
end
