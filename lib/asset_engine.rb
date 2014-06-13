if defined?(::CarrierWave)
  require 'active_admin_jcrop/asset_engine/carrier_wave'
elsif defined?(::Paperclip)
  require 'active_admin_jcrop/asset_engine/paperclip'
end
