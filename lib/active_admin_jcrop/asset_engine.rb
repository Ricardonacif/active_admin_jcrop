if Gem::Specification::find_all_by_name('carrierwave').any?
  require 'active_admin_jcrop/asset_engine/carrier_wave'
elsif Gem::Specification::find_all_by_name('paperclip').any?
  require 'active_admin_jcrop/asset_engine/paperclip'
end
