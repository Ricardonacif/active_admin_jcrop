module ActiveAdminJcrop
  class Engine < ::Rails::Engine
    
    initializer "ActiveAdmin precompile hook" do |app|
      app.config.assets.precompile += ['active_admin_jcrop/crop_modal.js', 'active_admin_jcrop/crop_modal.css', "active_admin_jcrop/jquery.color.js", "active_admin_jcrop/jquery.Jcrop.min.js", 'active_admin_jcrop/jquery.Jcrop.min.css']
    end
  end
end
